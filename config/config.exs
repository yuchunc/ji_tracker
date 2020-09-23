# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tracker,
  ecto_repos: [Tracker.Repo]

# Configures the endpoint
config :tracker, TrackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NDeaifaaulTYq6pnYfuCoqF768oGANeL8sdnpw/JDgSjqbOqycCJNb4EY1CRi8iQ",
  render_errors: [view: TrackerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Tracker.PubSub,
  live_view: [signing_salt: "l44+nn7u"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :tracker, TrackerWeb.Endpoint,
  live_view: [signing_salt: "wiTNg/TvMGJMGUry1KIlc/izqW4Ssf8L"]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
