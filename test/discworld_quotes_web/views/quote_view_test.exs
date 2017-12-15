defmodule DiscworldQuotesWeb.QuoteViewTest do
  use DiscworldQuotesWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders index.json" do
    conn = %{port: 80, scheme: "http", host: "example.com"}
    quote = %DiscworldQuotes.Quotes.Quote{
      id: 1,
      value: "A quote",
      source: "Abraham Lincoln",
    }
    assert render(DiscworldQuotesWeb.QuoteView, "index.json", %{quotes: [quote], conn: conn}) ==
      [%{
        id: 1,
        value: "A quote",
        source: "Abraham Lincoln",
        url: "http://example.com/quotes/1"
      }]
  end

  test "render show.json" do
    conn = %{port: 80, scheme: "http", host: "example.com"}
    quote = %DiscworldQuotes.Quotes.Quote{
      id: 1,
      value: "A quote",
      source: "Abraham Lincoln",
    }
    assert render(DiscworldQuotesWeb.QuoteView, "show.json", %{quote: quote, conn: conn}) ==
      %{
        id: 1,
        value: "A quote",
        source: "Abraham Lincoln",
        url: "http://example.com/quotes/1"
      }
  end

  test "render quote.json" do
    conn = %{port: 80, scheme: "http", host: "example.com"}
    quote = %DiscworldQuotes.Quotes.Quote{
      id: 1,
      value: "A quote",
      source: "Abraham Lincoln",
    }
    assert render(DiscworldQuotesWeb.QuoteView, "quote.json", %{quote: quote, conn: conn}) ==
      %{
        id: 1,
        value: "A quote",
        source: "Abraham Lincoln",
        url: "http://example.com/quotes/1"
      }
  end
end
