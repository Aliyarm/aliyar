defmodule Aliyar.Repo.Migrations.AddExchangesTable do
  use Ecto.Migration

  def change do
    create table("exchanges") do
      add :purchase, :string
      add :sale, :string
      add :currency, :string, size: 3
      add :date, :utc_datetime
    end
  end
end
