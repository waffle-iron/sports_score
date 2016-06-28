defmodule SportScore.PageView do
  use SportScore.Web, :view

  def render("changesetErrors.json", %{errors: errors}) do
    #render_many(errors, SportScore.PageView, "changesetError.json")
    %{
      success: false,
      errors: render_many(errors, SportScore.PageView, "changesetError.json", as: :error)
    }
  end

  def render("user.json", %{user: user}) do
    if is_nil(user) do
      %{id: 0}
    else
      %{id: user.id}
    end
  end

  def render("newUser.json", %{user: user}) do

  end

  def render("changesetError.json", %{error: error}) do
    {key, value} = error
    value
  end
end
