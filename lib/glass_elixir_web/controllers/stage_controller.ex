defmodule GlassElixirWeb.StageController do
  use GlassElixirWeb, :controller

  alias GlassElixir.Stages
  alias GlassElixir.Stages.Stage

  def index(conn, _params) do
    stages = Stages.list_stages()
    render(conn, "index.html", stages: stages)
  end

  def new(conn, _params) do
    changeset = Stages.change_stage(%Stage{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"stage" => stage_params}) do
    case Stages.create_stage(stage_params) do
      {:ok, stage} ->
        conn
        |> put_flash(:info, "Stage created successfully.")
        |> redirect(to: Routes.stage_path(conn, :show, stage))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    stage = Stages.get_stage!(id)
    render(conn, "show.html", stage: stage)
  end

  def edit(conn, %{"id" => id}) do
    stage = Stages.get_stage!(id)
    changeset = Stages.change_stage(stage)
    render(conn, "edit.html", stage: stage, changeset: changeset)
  end

  def update(conn, %{"id" => id, "stage" => stage_params}) do
    stage = Stages.get_stage!(id)

    case Stages.update_stage(stage, stage_params) do
      {:ok, stage} ->
        conn
        |> put_flash(:info, "Stage updated successfully.")
        |> redirect(to: Routes.stage_path(conn, :show, stage))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", stage: stage, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    stage = Stages.get_stage!(id)
    {:ok, _stage} = Stages.delete_stage(stage)

    conn
    |> put_flash(:info, "Stage deleted successfully.")
    |> redirect(to: Routes.stage_path(conn, :index))
  end
end
