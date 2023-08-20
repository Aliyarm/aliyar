defmodule Aliyar.Model.User do
  @moduledoc false
  use Ecto.Schema

  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @required_fields ~w(login password role)a
  @optional_fields ~w()a

  schema "users" do
    field :login, :string
    field :password, :string
    field :role, :integer
  end

  @doc false
  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, @optional_fields ++ @required_fields)
    |> validate_required(@required_fields)
    # |> unique_constraint([:currency])
  end
end
