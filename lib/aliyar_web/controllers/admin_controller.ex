defmodule AliyarWeb.AdminController do
  use AliyarWeb, :controller

  @doc """
  GET /admin/login
  Форма авторизации админа.
  """
  def login_form(conn, _params) do
    conn
    |> render(:login_form)
  end

  @doc """
  POST /admin/login
  Проверка вводимых данных при авторизации админа.
  """
  def login_admin_submit(conn, params) do
    IO.inspect(params)

    opts = %{
      login: params["login"],
      password: :crypto.hash(:sha256, params["password"]) |> Base.encode16()
    }

    case Aliyar.Context.Users.do_get(opts) do
      {:ok, admin} ->
        conn
        |> put_session(:admin, %{id: admin.id, login: admin.login})
        |> put_flash(:info, "Добро пожаловать #{admin.login}")
        |> redirect(to: "/admin/exchanges")

      {:error, :not_found} ->
        conn
        |> put_flash(:error, "Невеный логин или пароль")
        |> redirect(to: "/admin/login")
    end
  end

  def exchanges_list(conn, _params) do
    all_exchanges =
      Aliyar.Context.Exchanges.all()
      |> Enum.map(& Map.from_struct(&1))

    conn
    |> render(:exchanges_list, exchanges: all_exchanges)
  end

  # @doc """
  # GET /admin/logout
  # Выход из личного кабинета админа.
  # """
  # def admin_logout(conn, _params) do
  #   conn
  #   |> delete_session(:admin)
  #   |> redirect(to: "/admin/login")
  # end
end
