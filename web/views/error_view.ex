defmodule SportScore.ErrorView do
  use SportScore.Web, :view

  def render("404.html", _assigns) do
    "Page not found"
  end

  def render("500.html", _assigns) do
    "Server internal error"
  end

  def render("changesetError.json", %{error: error}) do
    {key, value} = error
    value
  end

  def render("changesetErrors.json", %{errors: errors}) do
    #render_many(errors, SportScore.PageView, "changesetError.json")
    %{
      success: false,
      errors: render_many(errors, SportScore.ErrorView, "changesetError.json", as: :error)
    }
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    render "500.html", assigns
  end
end
