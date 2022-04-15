defmodule GlassElixirWeb.PageController do
  use GlassElixirWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
