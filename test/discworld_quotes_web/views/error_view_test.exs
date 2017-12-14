defmodule DiscworldQuotesWeb.ErrorViewTest do
  use DiscworldQuotesWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.html" do
    assert render_to_string(DiscworldQuotesWeb.ErrorView, "404.html", []) ==
           "Page not found"
  end

  test "render 500.html" do
    assert render_to_string(DiscworldQuotesWeb.ErrorView, "500.html", []) ==
           "Internal server error"
  end

  test "render 404.json" do
    assert render(DiscworldQuotesWeb.ErrorView, "404.json", []) ==
      %{errors: %{detail: "Page not found"}}
  end

  test "render 422.json" do
    assert render(DiscworldQuotesWeb.ErrorView, "422.json", []) ==
      %{errors: %{detail: "Unprocessable entity"}}
  end

  test "render 500.json" do
    assert render(DiscworldQuotesWeb.ErrorView, "500.json", []) ==
      %{errors: %{detail: "Internal server error"}}
  end

  test "render any other" do
    assert render(DiscworldQuotesWeb.ErrorView, "505.html", []) ==
      %{errors: %{detail: "Internal server error"}}
  end
end
