defmodule SportScore.PostLoginAction do
  import Phoenix.Controller
  import Plug.Conn
  alias SportScore.Router.Helpers

  def set_session(conn, :ok, user) do
    current_user = %{
      username: user.username,
      is_admin: user.is_admin,
      id: user.id
                    }

    conne = assign(conn, :current_user, current_user)

    conne
    |> fetch_flash(:info)
    |> put_flash(:info, "Welome back, #{current_user.username}")
    |> redirect(to: Helpers.page_path(conn, :index))
    |> halt()
  end

  def set_session(conn, :error, errors) do
    IO.inspect errors
    conn
  end
end
