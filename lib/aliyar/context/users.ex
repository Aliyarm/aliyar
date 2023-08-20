defmodule Aliyar.Context.Users do
  @moduledoc """
  user context
  """
  use Aliyar.Context

  alias Aliyar.Model.User
  alias Aliyar.Context.Users

  require Logger

  @type user :: User.t()
  @type params :: Map.t()

  @doc false
  # usd = Aliyar.Context.Users.get(%{id: 1})
  def get(opts \\ []) do
    User
    |> filter_by(opts)
    |> Repo.one()
  end

  @doc false
  def all(opts \\ []) do
    User
    |> filter_by(opts)
    |> Repo.all()
  end

  @doc false
  def create(params) do
    params = %{login: params.login, password: hash_str(params.password), role: params.role}

    %User{}
    |> User.changeset(params)
    |> Repo.insert()
  end

  @doc """
  Удаление валюты по id. Если вызывается иключение возвращает :error.
  """
  # userr.Context.users.delete(4)
  def delete(user_id) do
    user = Users.get(id: user_id)

    try do
      Repo.delete(user)
    rescue
      _ -> {:error, user}
    end
  end

  @doc false
  # userr.Context.users.update(usd, %{purchase: "446,7"})
  @spec update(user, params) :: {:ok, user} | {:error, Ecto.Changeset.t()}
  def update(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end

  @doc """
  Hash string to SHA256
  "993" -> "40FB7164E459A38813F304E3B45DB2B074BE149818924E46FDC49CC38A3E4955".
  """
  @spec hash_str(String.t()) :: String.t()
  def hash_str(str) do
    :crypto.hash(:sha256, str) |> Base.encode16()
  end
end
