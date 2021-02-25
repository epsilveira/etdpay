use Mix.Config

#secret.csv has only the password of database, without " (like - postgres)
{:ok, pass} = File.read("secret.csv")

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :etdpay, Etdpay.Repo,
  username: "postgres",
  password: pass,
  database: "etdpay_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :etdpay, EtdpayWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
