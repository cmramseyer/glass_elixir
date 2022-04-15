defmodule GlassElixir.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :code, :string
    field :max_height, :integer
    field :max_width, :integer
    field :name, :string
    field :price_per_m2, :float
    field :thickness, :integer

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :code, :thickness, :max_width, :max_height, :price_per_m2])
    |> validate_required([:name, :code, :thickness, :max_width, :max_height, :price_per_m2])
    |> validate_number(:price_per_m2, greater_than: 0)
    |> validate_number(:thickness, greater_than: 0)
  end
end
