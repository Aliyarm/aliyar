defmodule AliyarWeb.AdminController do
  use AliyarWeb, :controller

  @doc """
  GET /admin/login
  Форма авторизации админа.
  """
  def login_form(conn, _params) do
    # changeset = Aliyar.Model.User.changeset(%User{})
    conn
    |> render(:login_form)
  end

  # @doc """
  # POST /admin/login
  # Проверка вводимых данных при авторизации админа.
  # """
  # def login_admin_submit(conn, params) do
  #   opts = [
  #     login: params["login"],
  #     password: hash_str(params["password"])
  #   ]

  #   case Admins.do_get(opts) do
  #     {:ok, admin} ->
  #       conn
  #       |> put_session(:admin, %{id: admin.id, login: admin.login})
  #       |> put_flash(:info, "Добро пожаловать #{admin.login}")
  #       |> redirect(to: "/admin/organization")

  #     {:error, :not_found} ->
  #       conn
  #       |> put_flash(:error, "Невеный логин или пароль")
  #       |> redirect(to: "/admin/login")
  #   end
  # end

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
