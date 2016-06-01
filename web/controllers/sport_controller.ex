defmodule SportScore.SportController do
  use SportScore.Web, :controller

  alias SportScore.Sport

  plug :scrub_params, "sport" when action in [:create, :update]
  plug Addict.Plugs.Authenticated when action in [:create, :update, :delete]

  def index(conn, _params) do
    sports = Repo.all(Sport)
    sports = [
      %{id: 1 , name: "LOOL" , user_id: 3},
      %{id: 1 , name: "LOOL" , user_id: 3},
      %{id: 1 , name: "LOOL" , user_id: 3},
      %{id: 1 , name: "LOOL" , user_id: 3},
      %{id: 1 , name: "LOOL" , user_id: 3},
      %{id: 1 , name: "LOOL" , user_id: 3},
      %{id: 1 , name: "LOOL" , user_id: 3}
    ]
    render(conn, "index.json", sports: sports)
  end

  def create(conn, %{"sport" => sport_params}) do
    current_user = Addict.Helper.current_user(conn)
    changeset = Sport.changeset(%Sport{}, sport_params)
    Ecto.Changeset.put_change(changeset, :user_id, current_user.id)

    case Repo.insert(changeset) do
      {:ok, sport} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", sport_path(conn, :show, sport))
        |> render("show.json", sport: sport)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(SportScore.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    sport = Repo.get!(Sport, id)
    render(conn, "show.json", sport: sport)
  end

  def update(conn, %{"id" => id, "sport" => sport_params}) do
    sport = Repo.get!(Sport, id)
    changeset = Sport.changeset(sport, sport_params)

    case Repo.update(changeset) do
      {:ok, sport} ->
        render(conn, "show.json", sport: sport)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(SportScore.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sport = Repo.get!(Sport, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(sport)

    send_resp(conn, :no_content, "")
  end
end
