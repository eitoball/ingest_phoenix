# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ingest_phoenix,
  ecto_repos: [IngestPhoenix.Repo]

# Configures the endpoint
config :ingest_phoenix, IngestPhoenix.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3PJb/pc60UITso0oVuAL9xIgK2F2vlv4Ctnw9pkzOBYv59HQn0uz5S7MiqOHPtL8",
  render_errors: [view: IngestPhoenix.ErrorView, accepts: ~w(html json)],
  pubsub: [name: IngestPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
