defmodule AliyarWeb.AliyarController do
  use AliyarWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
