defmodule SportScore.PageController do
  use SportScore.Web, :controller

  def index(conn, _params) do
    render conn, "index.html", current_user: get_session(conn, :current_user)
  end

  def logged_in(conn, _params) do
    render(conn, "user.json", user: Addict.Helper.current_user(conn))
  end
end
