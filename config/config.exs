# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :discworld_quotes,
  ecto_repos: [DiscworldQuotes.Repo]

# Configures the endpoint
config :discworld_quotes, DiscworldQuotesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HkoxyZAkHYMuilOKX4zl27gSq0n/Dukp5eXSQCNl6qdh9J21JCi84nIG9tb5CXkp",
  render_errors: [view: DiscworldQuotesWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DiscworldQuotes.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
