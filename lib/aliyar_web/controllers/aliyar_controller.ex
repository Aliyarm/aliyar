defmodule AliyarWeb.AliyarController do
  use AliyarWeb, :controller
  alias Aliyar.Context.Exchanges

  def index(conn, _params) do
    exchanges = Exchanges.all
    conn
    |> put_layout(html: :page)
    |> render(:index, exchanges: "Aliyar durak-prostak")
  end

end
