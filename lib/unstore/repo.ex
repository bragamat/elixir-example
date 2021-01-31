defmodule Unstore.Repo do
  use Ecto.Repo,
    otp_app: :unstore,
    adapter: Ecto.Adapters.Postgres
end
