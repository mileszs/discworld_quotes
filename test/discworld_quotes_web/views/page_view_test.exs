defmodule DiscworldQuotesWeb.PageViewTest do
  use DiscworldQuotesWeb.ConnCase, async: true

  describe "qurl" do
    # These are basically just duplicates of
    # test/discworld_quotes/quotes/quote_urls_test.exs. I
    # don't believe these are necessary, but want to leave them
    # possible spot checking in the future.
    #
    # At the time of this comment, these tests test this implementation:
    #
    # def qurl(conn, quote), do: DiscworldQuotes.Quotes.QuoteUrls.url(conn, quote)
    # def qurl(conn), do: DiscworldQuotes.Quotes.QuoteUrls.url(conn)
    #
    # test "with a single argument, returns the list path for quotes" do
    #   conn = %{port: 80, scheme: "http", host: "example.com"}
    #   assert DiscworldQuotesWeb.PageView.qurl(conn) == "http://example.com/quotes"
    # end
    #
    # test "with a quote, returns the show path for that quote" do
    #   conn = %{port: 80, scheme: "http", host: "example.com"}
    #   quote = %DiscworldQuotes.Quotes.Quote{id: 1}
    #   assert DiscworldQuotesWeb.PageView.qurl(conn, quote) == "http://example.com/quotes/1"
    # end
    #
    # test "with a string 'random', returns the show path for a random quote" do
    #   conn = %{port: 80, scheme: "http", host: "example.com"}
    #   assert DiscworldQuotesWeb.PageView.qurl(conn, "random") == "http://example.com/quotes/random"
    # end
    #
    # test "with a string 'search', returns the path for searching quotes" do
    #   conn = %{port: 80, scheme: "http", host: "example.com"}
    #   assert DiscworldQuotesWeb.PageView.qurl(conn, "search") == "http://example.com/quotes/search"
    # end
  end
end
