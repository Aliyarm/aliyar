defmodule Aliyar.Repo.Migrations.UsersTable do
  use Ecto.Migration

  def change do
    create table("users") do
      add :login, :string
      add :password, :string
      add :role, :integer
    end
  end
end
