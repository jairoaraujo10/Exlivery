defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case
  alias Exlivery.Orders.Item
  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, reurns the item" do
      response =
        Item.build(
          "Pizza de peperoni",
          :pizza,
          "35.5",
          1
        )

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "when there is an invalid category, reurns an error" do
      response =
        Item.build(
          "Pizza de peperoni",
          :invalid,
          "35.5",
          1
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end

    test "when there is an invalid price, reurns an error" do
      response =
        Item.build(
          "Pizza de peperoni",
          :pizza,
          "banana_price",
          1
        )

      expected_response = {:error, "Invalid price"}

      assert response == expected_response
    end

    test "when there is an invalid quantity, reurns an error" do
      response =
        Item.build(
          "Pizza de peperoni",
          :pizza,
          "35.5",
          0
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end