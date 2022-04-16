defmodule GlassElixir.Repo.Migrations.CreateStages do
  use Ecto.Migration

  def change do
    create table(:stages) do
      add :name, :string
      add :workload, :float

      timestamps()
    end
  end
end
