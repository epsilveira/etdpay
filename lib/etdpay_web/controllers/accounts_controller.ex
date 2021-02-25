defmodule EtdpayWeb.AccountsController do
  use EtdpayWeb, :controller

  alias Etdpay.Account
  alias Etdpay.Accounts.Transactions.Response, as: TransactionResponse

  action_fallback EtdpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Etdpay.deposit(params) do
      conn
      |> put_status(:created)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- Etdpay.withdraw(params) do
      conn
      |> put_status(:created)
      |> render("update.json", account: account)
    end
  end

  def transaction(conn, params) do
    with {:ok, %TransactionResponse{} = transaction} <- Etdpay.transaction(params) do
      conn
      |> put_status(:created)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
