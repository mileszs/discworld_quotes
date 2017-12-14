defmodule DiscworldQuotesWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use DiscworldQuotesWeb, :controller

  def call(conn, :unprocessable_entity) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(DiscworldQuotesWeb.ChangesetView, "422.json")
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> render(DiscworldQuotesWeb.ErrorView, :"404.json")
  end
end
