defmodule Etdpay.Users.CreateTest do
  use Etdpay.DataCase, async: true

  alias Etdpay.User
  alias Etdpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "Fulano De Tal",
        password: "12345678",
        nickname: "fulano",
        email: "fulano@dominio.com.br",
        age: 18
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Fulano De Tal", age: 18, id: ^user_id} = user
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Fulano De Tal",
        nickname: "fulano",
        email: "fulano@dominio.com.br",
        age: 15
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert errors_on(changeset) == expected_response
    end
  end

end
