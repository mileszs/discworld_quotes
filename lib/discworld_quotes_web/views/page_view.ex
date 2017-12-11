defmodule DiscworldQuotesWeb.PageView do
  use DiscworldQuotesWeb, :view

  def base_url(%{port: 80} = conn), do: "#{conn.host}"
  def base_url(%{port: 443} = conn), do: "#{conn.host}"
  def base_url(conn), do: "#{conn.host}:#{conn.port}"
end
