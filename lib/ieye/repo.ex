defmodule Ieye.Repo do
  use Ecto.Repo,
    otp_app: :ieye,
    adapter: Ecto.Adapters.Postgres
end
