defmodule DiscworldQuotesWeb.QuoteController do
  use DiscworldQuotesWeb, :controller

  alias DiscworldQuotes.Quotes
  alias DiscworldQuotes.Quotes.Quote

  action_fallback DiscworldQuotesWeb.FallbackController

  def index(conn, _params) do
    quotes = Quotes.list_quotes()
    render(conn, "index.json", quotes: quotes)
  end

  def show(conn, %{"id" => id}) do
    quote = Quotes.get_quote!(id)
    render(conn, "show.json", quote: quote)
  end
end
