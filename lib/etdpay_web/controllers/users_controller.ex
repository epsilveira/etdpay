defmodule EtdpayWeb.UsersController do
  use EtdpayWeb, :controller

  alias Etdpay.User

  action_fallback EtdpayWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Etdpay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  # defp handle_response({:error, _result} = error, _conn), do: error
end
