defmodule SportScore.PageController do
  use SportScore.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
