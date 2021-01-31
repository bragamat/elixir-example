defmodule Unstore.ProductsTest do
  use Unstore.DataCase

  alias Unstore.Fixtures.Products, as: ProductsMock
  alias Unstore.Products
  alias Unstore.Products.Product

  describe "products" do

    @update_attrs %{name: "new product"}
    @invalid_attrs %{name: nil, price: "invalid price"}

    test "list_product/0 returns all product" do
      {:ok, product} = ProductsMock.create_product()
      assert Products.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      {:ok, product} = ProductsMock.create_product()
      assert Products.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = _product} = Products.create_product(ProductsMock.valid_product)
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_product(ProductsMock.invalid_product)
    end

    test "update_product/2 with valid data updates the product" do
      {:ok, product} = ProductsMock.create_product()
      assert {:ok, %Product{} = _product} = Products.update_product(product, @update_attrs)
    end

    test "update_product/2 with invalid data returns error changeset" do
      {:ok, product} = ProductsMock.create_product()
      assert {:error, %Ecto.Changeset{}} = Products.update_product(product, @invalid_attrs)
      assert product == Products.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      {:ok, product} = ProductsMock.create_product()
      assert {:ok, %Product{}} = Products.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Products.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      {:ok, product} = ProductsMock.create_product()
      assert %Ecto.Changeset{} = Products.change_product(product)
    end
  end
end
