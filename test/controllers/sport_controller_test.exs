defmodule SportScore.SportControllerTest do
  use SportScore.ConnCase

  alias SportScore.Sport
  @valid_attrs %{name: "some content", name_system: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, sport_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    sport = Repo.insert! %Sport{}
    conn = get conn, sport_path(conn, :show, sport)
    assert json_response(conn, 200)["data"] == %{"id" => sport.id,
      "name" => sport.name,
      "name_system" => sport.name_system,
      "user_id" => sport.user_id}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, sport_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, sport_path(conn, :create), sport: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Sport, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, sport_path(conn, :create), sport: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    sport = Repo.insert! %Sport{}
    conn = put conn, sport_path(conn, :update, sport), sport: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Sport, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    sport = Repo.insert! %Sport{}
    conn = put conn, sport_path(conn, :update, sport), sport: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    sport = Repo.insert! %Sport{}
    conn = delete conn, sport_path(conn, :delete, sport)
    assert response(conn, 204)
    refute Repo.get(Sport, sport.id)
  end
end
