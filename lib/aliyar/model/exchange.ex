defmodule Aliyar.Model.Exchange do
  @moduledoc false
  use Ecto.Schema

  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @required_fields ~w(purchase sale currency date)a
  @optional_fields ~w()a

  schema "exchanges" do
    field :purchase, :string
    field :sale, :string
    field :currency, :string
    field :date, :utc_datetime
  end

  @doc false
  def changeset(city, attrs) do
    city
    |> cast(attrs, @optional_fields ++ @required_fields)
    |> validate_required(@required_fields)
    # |> unique_constraint([:currency])
  end
end
