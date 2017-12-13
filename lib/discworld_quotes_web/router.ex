defmodule DiscworldQuotesWeb.Router do
  use DiscworldQuotesWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :slack do
    plug :accepts, ["json", "html"]
    plug DiscworldQuotesWeb.Plugs.SlackTokenCheck
  end

  scope "/", DiscworldQuotesWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/", DiscworldQuotesWeb do
    pipe_through :api

    get "/quotes/random", QuoteController, :random
    get "/quotes/search", QuoteController, :search
    resources "/quotes", QuoteController, only: [:index, :show]
  end

  scope "/", DiscworldQuotesWeb do
    post "/slack", SlackController, :index
  end
end
