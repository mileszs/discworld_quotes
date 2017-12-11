defmodule DiscworldQuotesWeb.PageView do
  use DiscworldQuotesWeb, :view

  def qurl(conn, quote), do: DiscworldQuotes.Quotes.QuoteUrls.url(conn, quote)
  def qurl(conn), do: DiscworldQuotes.Quotes.QuoteUrls.url(conn)
end
