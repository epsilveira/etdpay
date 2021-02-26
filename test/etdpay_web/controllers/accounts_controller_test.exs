defmodule EtdpayWeb.AccountsControllerTest do
  use EtdpayWeb.ConnCase, async: true

  alias Etdpay.{Account, User}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "Fulano De Tal",
        password: "12345678",
        nickname: "fulano",
        email: "fulano@dominio.com.br",
        age: 18
      }

      {:ok, %User{account: %Account{id: account_id}}} = Etdpay.create_user(params)

      # Base.encode64("user:pass")
      conn = put_req_header(conn, "authorization", "Basic YmFuYW5hOm5hbmljYTEyMw==")

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, make the desposit", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

      assert %{
                "account" => %{"balance" => "50.00", "id" => _id},
                "message" => "Balance changed successfully"
              } = response
    end

    test "when there are invalid, returnas an error", %{conn: conn, account_id: account_id} do
      params = %{"value" => "banana"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid deposit value!"}

      assert response == expected_response
    end
  end
end
