defmodule SportScore.UserView do
  use SportScore.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, SportScore.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, SportScore.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name
    }
  end

  def render("newUser.json", %{user: user}) do
    %{
      success: true,
      message: "The user has been created. An email has been sent to confirm your address!",
      data: %{
        username: user.username,
        email: user.email
      }
    }
  end

  def render("loggedIn.json", %{user: user}) do
    %{
      success: true,
      message: "Congratulations, your are logged in",
      data: %{}
    }
  end
end
