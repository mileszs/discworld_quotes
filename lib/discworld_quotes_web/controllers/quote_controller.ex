defmodule DiscworldQuotesWeb.QuoteController do
  use DiscworldQuotesWeb, :controller

  alias DiscworldQuotes.Quotes

  action_fallback DiscworldQuotesWeb.FallbackController

  def index(conn, _params) do
    quotes = Quotes.list_quotes()
    render(conn, "index.json", quotes: quotes)
  end

  def show(conn, %{"id" => id}) do
    quote = Quotes.get_quote!(id)
    render(conn, "show.json", quote: quote)
  end

  def random(conn, _params) do
    quote = Quotes.get_random_quote!
    render(conn, "show.json", quote: quote)
  end
end
