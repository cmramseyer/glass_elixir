defmodule GlassElixir.StagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GlassElixir.Stages` context.
  """

  @doc """
  Generate a stage.
  """
  def stage_fixture(attrs \\ %{}) do
    {:ok, stage} =
      attrs
      |> Enum.into(%{
        name: "some name",
        workload: 120.5
      })
      |> GlassElixir.Stages.create_stage()

    stage
  end
end
