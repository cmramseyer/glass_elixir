defmodule GlassElixir.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :code, :string
      add :thickness, :integer
      add :max_width, :integer
      add :max_height, :integer
      add :price_per_m2, :float

      timestamps()
    end
  end
end
