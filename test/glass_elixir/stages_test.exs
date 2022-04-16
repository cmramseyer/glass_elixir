defmodule GlassElixir.StagesTest do
  use GlassElixir.DataCase

  alias GlassElixir.Stages

  describe "stages" do
    alias GlassElixir.Stages.Stage

    import GlassElixir.StagesFixtures

    @invalid_attrs %{name: nil, workload: nil}

    test "list_stages/0 returns all stages" do
      stage = stage_fixture()
      assert Stages.list_stages() == [stage]
    end

    test "get_stage!/1 returns the stage with given id" do
      stage = stage_fixture()
      assert Stages.get_stage!(stage.id) == stage
    end

    test "create_stage/1 with valid data creates a stage" do
      valid_attrs = %{name: "some name", workload: 120.5}

      assert {:ok, %Stage{} = stage} = Stages.create_stage(valid_attrs)
      assert stage.name == "some name"
      assert stage.workload == 120.5
    end

    test "create_stage/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stages.create_stage(@invalid_attrs)
    end

    test "update_stage/2 with valid data updates the stage" do
      stage = stage_fixture()
      update_attrs = %{name: "some updated name", workload: 456.7}

      assert {:ok, %Stage{} = stage} = Stages.update_stage(stage, update_attrs)
      assert stage.name == "some updated name"
      assert stage.workload == 456.7
    end

    test "update_stage/2 with invalid data returns error changeset" do
      stage = stage_fixture()
      assert {:error, %Ecto.Changeset{}} = Stages.update_stage(stage, @invalid_attrs)
      assert stage == Stages.get_stage!(stage.id)
    end

    test "delete_stage/1 deletes the stage" do
      stage = stage_fixture()
      assert {:ok, %Stage{}} = Stages.delete_stage(stage)
      assert_raise Ecto.NoResultsError, fn -> Stages.get_stage!(stage.id) end
    end

    test "change_stage/1 returns a stage changeset" do
      stage = stage_fixture()
      assert %Ecto.Changeset{} = Stages.change_stage(stage)
    end
  end
end
