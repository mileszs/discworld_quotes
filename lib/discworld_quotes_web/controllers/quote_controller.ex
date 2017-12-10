defmodule DiscworldQuotesWeb.QuoteController do
  use DiscworldQuotesWeb, :controller

  alias DiscworldQuotes.Quotes
  alias DiscworldQuotes.Quotes.Quote

  action_fallback DiscworldQuotesWeb.FallbackController

  def index(conn, _params) do
    quotes = Quotes.list_quotes()
    render(conn, "index.json", quotes: quotes)
  end

  def create(conn, %{"quote" => quote_params}) do
    with {:ok, %Quote{} = quote} <- Quotes.create_quote(quote_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", quote_path(conn, :show, quote))
      |> render("show.json", quote: quote)
    end
  end

  def show(conn, %{"id" => id}) do
    quote = Quotes.get_quote!(id)
    render(conn, "show.json", quote: quote)
  end

  def update(conn, %{"id" => id, "quote" => quote_params}) do
    quote = Quotes.get_quote!(id)

    with {:ok, %Quote{} = quote} <- Quotes.update_quote(quote, quote_params) do
      render(conn, "show.json", quote: quote)
    end
  end

  def delete(conn, %{"id" => id}) do
    quote = Quotes.get_quote!(id)
    with {:ok, %Quote{}} <- Quotes.delete_quote(quote) do
      send_resp(conn, :no_content, "")
    end
  end
end
