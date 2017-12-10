defmodule DiscworldQuotesWeb.QuoteControllerTest do
  use DiscworldQuotesWeb.ConnCase

  alias DiscworldQuotes.Quotes
  alias DiscworldQuotes.Quotes.Quote

  @create_attrs %{source: "some source", value: "some value"}
  @update_attrs %{source: "some updated source", value: "some updated value"}
  @invalid_attrs %{source: nil, value: nil}

  def fixture(:quote) do
    {:ok, quote} = Quotes.create_quote(@create_attrs)
    quote
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all quotes", %{conn: conn} do
      conn = get conn, quote_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create quote" do
    test "renders quote when data is valid", %{conn: conn} do
      conn = post conn, quote_path(conn, :create), quote: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, quote_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "source" => "some source",
        "value" => "some value"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, quote_path(conn, :create), quote: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update quote" do
    setup [:create_quote]

    test "renders quote when data is valid", %{conn: conn, quote: %Quote{id: id} = quote} do
      conn = put conn, quote_path(conn, :update, quote), quote: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, quote_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "source" => "some updated source",
        "value" => "some updated value"}
    end

    test "renders errors when data is invalid", %{conn: conn, quote: quote} do
      conn = put conn, quote_path(conn, :update, quote), quote: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete quote" do
    setup [:create_quote]

    test "deletes chosen quote", %{conn: conn, quote: quote} do
      conn = delete conn, quote_path(conn, :delete, quote)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, quote_path(conn, :show, quote)
      end
    end
  end

  defp create_quote(_) do
    quote = fixture(:quote)
    {:ok, quote: quote}
  end
end
