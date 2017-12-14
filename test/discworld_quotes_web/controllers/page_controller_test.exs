defmodule DiscworldQuotesWeb.PageControllerTest do
  use DiscworldQuotesWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Usage"
  end
end
