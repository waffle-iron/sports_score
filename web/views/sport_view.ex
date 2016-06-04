defmodule SportScore.SportView do
  use SportScore.Web, :view

  def render("index.json", %{sports: sports}) do
    %{data: render_many(sports, SportScore.SportView, "sport.json")}
  end

  def render("show.json", %{sport: sport}) do
    %{data: render_one(sport, SportScore.SportView, "sport.json")}
  end

  def render("sport.json", %{sport: sport}) do  
    %{
      id: sport.id,
      name: sport.name,
      user_id: sport.user.id,
      user: render_one(sport.user, SportScore.UserView, "user.json")
    }
  end
end
