defmodule Aliyar.Context.Exchanges do
  @moduledoc """
  Exchange context
  """
  use Aliyar.Context

  alias Aliyar.Model.Exchange
  alias Aliyar.Context.Exchanges

  require Logger

  @type exchange :: Exchange.t()
  @type params :: Map.t()

  @doc false
  # usd = Aliyar.Context.Exchanges.get(%{id: 1})
  def get(opts \\ []) do
    Exchange
    |> filter_by(opts)
    |> Repo.one()
  end

  @doc false
  def all(opts \\ []) do
    Exchange
    |> filter_by(opts)
    |> Repo.all()
  end

  @doc false
  def create(params) do
    %Exchange{}
    |> Exchange.changeset(params)
    |> Repo.insert()
  end

  @doc """
  Удаление валюты по id. Если вызывается иключение возвращает :error.
  """
  # Exchanger.Context.Exchanges.delete(4)
  def delete(exchange_id) do
    exchange = Exchanges.get(id: exchange_id)
    try do
      Repo.delete(exchange)
    rescue
      _ -> {:error, exchange}
    end
  end

  @doc false
  # Exchanger.Context.Exchanges.update(usd, %{purchase: "446,7"})
  @spec update(exchange, params) :: {:ok, exchange} | {:error, Ecto.Changeset.t()}
  def update(exchange, params) do
    exchange
    |> Exchange.changeset(params)
    |> Repo.update()
  end
end
