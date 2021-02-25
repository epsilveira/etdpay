defmodule Etdpay.Repo do
  use Ecto.Repo,
    otp_app: :etdpay,
    adapter: Ecto.Adapters.Postgres
end
