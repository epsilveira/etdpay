defmodule Etdpay.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Etdpay.Repo,
      # Start the Telemetry supervisor
      EtdpayWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Etdpay.PubSub},
      # Start the Endpoint (http/https)
      EtdpayWeb.Endpoint
      # Start a worker by calling: Etdpay.Worker.start_link(arg)
      # {Etdpay.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Etdpay.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    EtdpayWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
