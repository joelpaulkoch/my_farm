defmodule MyFarm.Repo do
  use Ecto.Repo,
    otp_app: :my_farm,
    adapter: Ecto.Adapters.Postgres
end
