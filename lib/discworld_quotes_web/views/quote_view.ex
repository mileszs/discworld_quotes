defmodule DiscworldQuotesWeb.QuoteView do
  use DiscworldQuotesWeb, :view
  alias DiscworldQuotesWeb.QuoteView

  def render("index.json", %{quotes: quotes, conn: conn}) do
    render_many(quotes, QuoteView, "quote.json", %{conn: conn})
  end

  def render("show.json", %{quote: quote, conn: conn}) do
    render_one(quote, QuoteView, "quote.json", %{conn: conn})
  end

  def render("quote.json", %{quote: quote, conn: conn}) do
    %{id: quote.id,
      value: quote.value,
      source: quote.source,
      url: DiscworldQuotes.Quotes.QuoteUrls.url(conn, quote)}
  end
end
