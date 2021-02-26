defmodule EtdpayWeb.UsersViewTest do
  use EtdpayWeb.ConnCase, async: true

  import Phoenix.View

  alias Etdpay.{Account, User}
  alias EtdpayWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "Fulano De Tal",
      password: "12345678",
      nickname: "fulano",
      email: "fulano@dominio.com.br",
      age: 18
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} = Etdpay.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        account: %{
          balance: Decimal.new("0.00"),
          id: account_id
        },
        id: user_id,
        name: "Fulano De Tal",
        nickname: "fulano"
      }
    }

    assert expected_response == response
  end
end
