defmodule Unstore.Fixtures.Products do
  @moduledoc """
  Module with functions to create Products and return attributes
  """
  alias Unstore.Products

  @valid_product %{
    name: Faker.Person.name,
    price: :rand.uniform(16) / 100 * 99 |> Float.round(2)
  }

  @invalid_product %{
    name: nil,
    price: nil
  }

  def create_product, do: Products.create_product(@valid_product)
  def create_product(attrs), do: Products.create_product(attrs)

  def valid_product, do: @valid_product

  def invalid_product, do: @invalid_product
end
