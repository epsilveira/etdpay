defmodule Etdpay do
  alias Etdpay.Users.Create, as: UserCreate

  alias Etdpay.Accounts.Deposit

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate deposit(params), to: Deposit, as: :call
end
