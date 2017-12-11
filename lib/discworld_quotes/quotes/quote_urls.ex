defmodule DiscworldQuotes.Quotes.QuoteUrls do
  def url(conn, "random"), do: "#{base_url(conn)}/quotes/random"
  def url(conn, quote), do: "#{base_url(conn)}/quotes/#{quote.id}"
  def url(conn), do: "#{base_url(conn)}/quotes"

  defp base_url(%{port: 80} = conn), do: "#{conn.scheme}://#{conn.host}"
  defp base_url(%{port: 443} = conn), do: "#{conn.scheme}://#{conn.host}"
  defp base_url(conn), do: "#{conn.scheme}://#{conn.host}:#{conn.port}"
end
