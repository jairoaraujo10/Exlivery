defmodule Exlivery.Orders.OrderTest do
  use ExUnit.Case
  alias Exlivery.Orders.Order
  import Exlivery.Factory

  describe "build/2" do
    test "when all params are valid, reurns the item" do
      user = build(:user)

      items = [
        build(:item),
        build(:item,
          description: "Temaki",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("20.50")
        )
      ]

      response = Order.build(user, items)
      expected_response = {:ok, build(:order)}

      assert response == expected_response
    end

    test "when there is no items on the order, reurns an error" do
      user = build(:user)

      items = []

      response = Order.build(user, items)
      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
