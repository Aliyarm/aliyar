defmodule AliyarWeb.AliyarController do
  use AliyarWeb, :controller

  def index(conn, _params) do
    conn
    |> put_layout(html: :page)
    |> render(:index)
  end

end
