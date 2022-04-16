defmodule GlassElixir.Stages.Stage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stages" do
    field :name, :string
    field :workload, :float

    timestamps()
  end

  @doc false
  def changeset(stage, attrs) do
    stage
    |> cast(attrs, [:name, :workload])
    |> validate_required([:name, :workload])
  end
end
