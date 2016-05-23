defmodule SportScore.LayoutView do
  use SportScore.Web, :view

  def current_user(conn) do
     Addict.Helper.current_user(conn)
  end
end
