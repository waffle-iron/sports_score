defmodule SportScore.PageView do
  use SportScore.Web, :view

  def render("user.json", %{user: user}) do
    if is_nil(user) do
      %{id: 0}
    else
      %{id: user.id}
    end
  end
end
