defmodule DiscworldQuotesWeb.SlackController do
  use DiscworldQuotesWeb, :controller

  alias DiscworldQuotes.Quotes

  action_fallback DiscworldQuotesWeb.FallbackController

  def index(conn, _params) do
    quote = Quotes.get_random_quote!
    render(conn, "index.json", quote: quote)
  end
end
