defmodule DiscworldQuotesWeb.QuoteView do
  use DiscworldQuotesWeb, :view
  alias DiscworldQuotesWeb.QuoteView

  def render("index.json", %{quotes: quotes}) do
    %{data: render_many(quotes, QuoteView, "quote.json")}
  end

  def render("show.json", %{quote: quote}) do
    %{data: render_one(quote, QuoteView, "quote.json")}
  end

  def render("quote.json", %{quote: quote}) do
    %{id: quote.id,
      value: quote.value,
      source: quote.source}
  end
end
