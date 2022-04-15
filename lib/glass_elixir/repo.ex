defmodule GlassElixir.Repo do
  use Ecto.Repo,
    otp_app: :glass_elixir,
    adapter: Ecto.Adapters.Postgres
end
