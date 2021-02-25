defmodule Etdpay.Accounts.Transaction do
  alias Ecto.Multi

  alias Etdpay.{Accounts.Operation, Repo}
  alias Etdpay.Accounts.Transactions.Response, as: TransactionResponse

  def call(%{"from" => from_id, "to" => to_id, "value" => value}) do
    withdraw_params = build_params(from_id, value)
    deposit_params = build_params(to_id, value)

    Multi.new()
    |> Multi.merge(fn _changes -> Operation.call(withdraw_params, :withdraw) end)
    |> Multi.merge(fn _changes -> Operation.call(deposit_params, :deposit) end)
    |> run_transaction()
  end

  defp build_params(id, value), do: %{"id" => id, "value" => value}

  defp run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operation, reason, _changes} -> {:error, reason}
      {:ok, %{deposit: to_account, withdraw: from_account}} ->
        {:ok, TransactionResponse.build(from_account, to_account)}
    end
  end
end

# Tests ies -S mix
# Etdpay.Repo.all(Etdpay.Account)
# Etdpay.Accounts.Transaction.call(%{"from" => "19d059f9-85c2-4dc0-903c-03b7b42e9232", "to" => "4d8d4d84-6650-4e9f-a5e9-478d8d1bc8f5", "value" => "1.00"})
