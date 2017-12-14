defmodule DiscworldQuotesWeb.QuoteControllerTest do
  use DiscworldQuotesWeb.ConnCase

  alias DiscworldQuotes.Quotes
  alias DiscworldQuotes.Quotes.Quote

  @create_attrs %{source: "some source", value: "some value"}

  def fixture(:quote) do
    {:ok, quote} = Quotes.create_quote(@create_attrs)
    quote
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    setup [:create_quote]

    test "lists all quotes", %{conn: conn} do
      conn = get conn, quote_path(conn, :index)
      assert [%{"source" => _}] = json_response(conn, 200)
    end
  end

  describe "search" do
    setup [:create_quote]

    test "search all quotes", %{conn: conn} do
      conn = get conn, quote_path(conn, :search, %{query: "value"})
      assert [%{"source" => _}] = json_response(conn, 200)
    end
  end

  describe "show" do
    setup [:create_quote]

    test "renders quote", %{conn: conn, quote: %Quote{id: id}} do
      conn = get conn, quote_path(conn, :show, id)
      assert json_response(conn, 200) == %{
        "id" => id,
        "source" => "some source",
        "value" => "some value",
        "url" => "http://www.example.com/quotes/#{id}"
      }
    end
  end

  describe "random" do
    setup [:create_quote]

    test "renders random quote", %{conn: conn} do
      conn = get conn, quote_path(conn, :random)
      assert %{"id" => _id, "source" => _source, "value" => _value, "url" => _url} = json_response(conn, 200)
    end
  end

  defp create_quote(_) do
    quote = fixture(:quote)
    {:ok, quote: quote}
  end
end
