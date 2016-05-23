defmodule SportScore.PageController do
  use SportScore.Web, :controller

  def index(conn, _params) do  	
  	IO.inspect(Application.get_all_env(:addict))
    render conn, "index.html", current_user: get_session(conn, :current_user)
  end
end