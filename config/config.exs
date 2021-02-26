# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :etdpay,
  ecto_repos: [Etdpay.Repo]

# Configures the endpoint
config :etdpay, EtdpayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2KRcS7ucgvQXXrtWNXCphSEgM1nlWUWN5w7SG7x7reNt+O9nMZXk6kqty8Au9Lw7",
  render_errors: [view: EtdpayWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Etdpay.PubSub,
  live_view: [signing_salt: "iY8fFq/T"]

config :etdpay, Etdpay.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :etdpay, :basic_auth,
  username: System.get_env("AUTH_USERNAME"),
  password: System.get_env("AUTH_PASSWORD")

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
