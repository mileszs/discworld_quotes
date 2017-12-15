defmodule DiscworldQuotes.Quotes.QuoteUrlsTest do
  use ExUnit.Case
  import DiscworldQuotes.Quotes.QuoteUrls

  describe "url" do
    test "with a single argument, returns the list path for quotes" do
      conn = %{port: 80, scheme: "http", host: "example.com"}
      assert url(conn) == "http://example.com/quotes"
    end

    test "with a quote, returns the show path for that quote" do
      conn = %{port: 80, scheme: "http", host: "example.com"}
      quote = %DiscworldQuotes.Quotes.Quote{id: 1}
      assert url(conn, quote) == "http://example.com/quotes/1"
    end

    test "with a string 'random', returns the show path for a random quote" do
      conn = %{port: 80, scheme: "http", host: "example.com"}
      assert url(conn, "random") == "http://example.com/quotes/random"
    end

    test "with a string 'search', returns the path for searching quotes" do
      conn = %{port: 80, scheme: "http", host: "example.com"}
      assert url(conn, "search") == "http://example.com/quotes/search"
    end
  end
end
