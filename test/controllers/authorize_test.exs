defmodule SportScore.AuthorizeTest do
  use SportScore.ConnCase

  import Openmaize.DB
  import OpenmaizeJWT.Create
  alias SportScore.{Repo, User}

  @valid_attrs %{email: "tony@mail.com", password: "mangoes&g0oseberries"}
  @invalid_attrs %{email: "tony@mail.com", password: "maaaangoes&g00zeberries"}

  {:ok, user_token} = %{id: 3, email: "tony@mail.com", role: "user"}
                      |> generate_token({0, 1440})
  @user_token user_token

  setup do
    conn = conn()
    |> put_req_cookie("access_token", @user_token)
    {:ok, conn: conn}
  end

  # The first three tests can be used to test routes protected by
  # the role_check plug or the custom action (authorize_action) function
  @tag :pending
  test "correct user role is successfully authorized", %{conn: conn} do

  end

  @tag :pending
  test "authorization for incorrect role fails", %{conn: conn} do

  end

  @tag :pending
  test "authorization for nil user fails" do

  end

  # Test routes protected by the id_check plug
  @tag :pending
  test "id check succeeds", %{conn: conn} do

  end

  @tag :pending
  test "id check fails for incorrect id", %{conn: conn} do

  end

  @tag :pending
  test "id check fails for nil user" do

  end

  @tag :pending
  test "login succeeds" do
    # Remove the Repo.get_by line if you are not using email confirmation
    #Repo.get_by(User, %{email: "tony@mail.com"}) |> user_confirmed

  end

  @tag :pending
  test "login fails" do
    # Remove the Repo.get_by line if you are not using email confirmation
    #Repo.get_by(User, %{email: "reg@mail.com"}) |> user_confirmed

  end

  @tag :pending
  test "logout succeeds" do
  {:ok, user_token} = %{id: 3, email: "tony@mail.com", role: "user"}
                      |> generate_token({0, 1440})
    conn = conn()
    |> put_req_cookie("access_token", user_token)
    |> delete("/logout")
    assert redirected_to(conn) == "/"
  end

end
