defmodule DiscworldQuotesWeb.Plugs.SlackTokenCheck do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, params) do
    unless params.token && params.token == System.get_env("SLACK_TOKEN") do
      halt(conn)
    end
  end
end
