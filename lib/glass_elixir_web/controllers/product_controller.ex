defmodule GlassElixirWeb.ProductController do
  use GlassElixirWeb, :controller
  alias GlassElixir.Repo
  import Ecto.Query

  def index(conn, _params) do
    query = from(p in GlassElixir.Product)
    products = Repo.all(query)
    conn
    |> assign(:products, products)
    |> render("index.html")
  end
end
