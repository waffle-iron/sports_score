defmodule SportScore.SportControllerTest do
  use SportScore.ConnCase

  alias SportScore.Sport
  @valid_attrs %{name: "some content", name_system: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  @tag :pending
  test "lists all entries on index", %{conn: conn} do
    
  end

  @tag :pending
  test "shows chosen resource", %{conn: conn} do

  end

  @tag :pending
  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do

  end

  @tag :pending
  test "creates and renders resource when data is valid", %{conn: conn} do

  end

  @tag :pending
  test "does not create resource and renders errors when data is invalid", %{conn: conn} do

  end

  @tag :pending
  test "updates and renders chosen resource when data is valid", %{conn: conn} do

  end

  @tag :pending
  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do

  end

  @tag :pending
  test "deletes chosen resource", %{conn: conn} do

  end
end
