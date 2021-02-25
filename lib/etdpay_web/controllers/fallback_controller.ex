defmodule EtdpayWeb.FallbackController do
  use EtdpayWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(EtdpayWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
