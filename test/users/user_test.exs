defmodule Exlivery.Users.UserTest do
  use ExUnit.Case
  alias Exlivery.Users.User
  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, reurns the user" do
      response =
        User.build(
          "Jairo",
          "algum@mail.com",
          "123.456.789-00",
          22,
          "Rua qualquer, sn"
        )

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when there are invalid params, return an error" do
      response =
        User.build(
          "Jairo",
          "algum@mail.com",
          "123.456.789-00",
          15,
          "Rua qualquer, sn"
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
