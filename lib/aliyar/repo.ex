defmodule Aliyar.Repo do
  use Ecto.Repo,
    otp_app: :aliyar,
    adapter: Ecto.Adapters.Postgres
end
