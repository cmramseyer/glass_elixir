defmodule GlassElixirWeb.StageControllerTest do
  use GlassElixirWeb.ConnCase

  import GlassElixir.StagesFixtures

  @create_attrs %{name: "some name", workload: 120.5}
  @update_attrs %{name: "some updated name", workload: 456.7}
  @invalid_attrs %{name: nil, workload: nil}

  describe "index" do
    test "lists all stages", %{conn: conn} do
      conn = get(conn, Routes.stage_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Stages"
    end
  end

  describe "new stage" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.stage_path(conn, :new))
      assert html_response(conn, 200) =~ "New Stage"
    end
  end

  describe "create stage" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.stage_path(conn, :create), stage: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.stage_path(conn, :show, id)

      conn = get(conn, Routes.stage_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Stage"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.stage_path(conn, :create), stage: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Stage"
    end
  end

  describe "edit stage" do
    setup [:create_stage]

    test "renders form for editing chosen stage", %{conn: conn, stage: stage} do
      conn = get(conn, Routes.stage_path(conn, :edit, stage))
      assert html_response(conn, 200) =~ "Edit Stage"
    end
  end

  describe "update stage" do
    setup [:create_stage]

    test "redirects when data is valid", %{conn: conn, stage: stage} do
      conn = put(conn, Routes.stage_path(conn, :update, stage), stage: @update_attrs)
      assert redirected_to(conn) == Routes.stage_path(conn, :show, stage)

      conn = get(conn, Routes.stage_path(conn, :show, stage))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, stage: stage} do
      conn = put(conn, Routes.stage_path(conn, :update, stage), stage: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Stage"
    end
  end

  describe "delete stage" do
    setup [:create_stage]

    test "deletes chosen stage", %{conn: conn, stage: stage} do
      conn = delete(conn, Routes.stage_path(conn, :delete, stage))
      assert redirected_to(conn) == Routes.stage_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.stage_path(conn, :show, stage))
      end
    end
  end

  defp create_stage(_) do
    stage = stage_fixture()
    %{stage: stage}
  end
end
