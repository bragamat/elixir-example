defmodule Unstore.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :price, :float
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :price])
    |> validate_required([:name, :price])
  end
end
