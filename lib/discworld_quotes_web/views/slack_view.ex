defmodule DiscworldQuotesWeb.SlackView do
  use DiscworldQuotesWeb, :view

  def render("index.json", %{quote: quote}), do: "#{quote.value} - #{quote.source}"
end
