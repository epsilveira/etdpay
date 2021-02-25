defmodule EtdpayWeb.AccountsController do
  use EtdpayWeb, :controller

  alias Etdpay.Account

  action_fallback EtdpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Etdpay.deposit(params) do
      conn
      |> put_status(:created)
      |> render("update.json", account: account)
    end
  end
end
