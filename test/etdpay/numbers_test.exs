defmodule Etdpay.NumbersTest do
  use ExUnit.Case, async: true

  alias Etdpay.Numbers

  describe "sum_from_file/1" do
    test "when there is a file with the given name, return the sum of numbers" do
      response = Numbers.sum_from_file("numbers")
      expected_response = {:ok, %{result: 37}}
      assert response == expected_response
    end

    test "when there is no file with the given name, return an error" do
      response = Numbers.sum_from_file("no_file")
      expected_response = {:error, %{message: "Invalid file!"}}
      assert response == expected_response
    end
  end
end
