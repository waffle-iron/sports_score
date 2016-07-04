defmodule SportScore.ConfirmTest do
  use SportScore.ConnCase
  alias SportScore.User

  @valid_link "email=gladys%40mail.com&key=pu9-VNdgE8V9qZo19rlcg3KUNjpxuixg"
  @invalid_link "email=gladys%40mail.com&key=pu9-VNdgE8V9QzO19RLCG3KUNjpxuixg"
  @valid_attrs %{email: "gladys@mail.com", password: "^hEsdg*F899",
    key: "pu9-VNdgE8V9qZo19rlcg3KUNjpxuixg"}
  @invalid_attrs %{email: "gladys@mail.com",  password: "^hEsdg*F899",
    key: "pu9-VNDGe8v9QzO19RLCg3KUNjpxuixg"}
  @invalid_pass %{email: "gladys@mail.com", password: "qwerty",
    key: "pu9-VNdgE8V9qZo19rlcg3KUNjpxuixg"}
  @valid_confirm %{email: "keva@yopmail.com", key: "CLgilfnScYIBOAyrAdb71jVEtcCsBCew"}
  @invalid_confirm %{email: "gladys@mail.com", key: "pu9-VNdgE8V9QZo19RLCG3KUNjpxuixg"}
  @valid_reset %{email: "keva@yopmail.com", key: "CLgilfnScYIBOAyrAdb71jVEtcCsBCew",  password: "^hEsdg*F899"}
  @invalid_reset %{email: "gladys@mail.com", key: "pu9-VNdgE8V9QZo19RLCG3KUNjpxuixg",  password: "^hEsdg*F899"}
  @invalid_pass %{email: "gladys@mail.com", key: "pu9-VNdgE8V9QZo19RLCG3KUNjpxuixg", password: "qwerty"}


  # The first two tests are for email confirmation.
  # In this case, you need to add the confirmation_token (key)
  # to a user with the email "gladys@mail.com" before running these tests
  @email "keva@yopmail.com"


  setup do
    #userChangeset = User.changeset(%User{}, %{email: @email, username: "Kevin", password_hash: "averitole972!", confirmation_token: "pu9-VNdgE8V9qZo19rlcg3KUNjpxuixg", role: "user"})

    userChangeset = User.auth_changeset(%User{}, %{email: @email, username: "Kevin", password: "averitole972!"},  "CLgilfnScYIBOAyrAdb71jVEtcCsBCew")
    {:ok, user}  = Repo.insert(userChangeset)

    resetChangeset = User.reset_changeset(Repo.get_by(User, email: @email),%{email: @email}, "CLgilfnScYIBOAyrAdb71jVEtcCsBCew")
    {:ok, user} = Repo.update(resetChangeset)

    {:ok, data: user}
  end

  test "confirmation succeeds for correct key" do
    conn = conn() |> post("/confirm", @valid_confirm)
    {:ok, reponse} = Poison.Parser.parse(~s(#{conn.resp_body}))

    assert json_response(conn, 200)
    assert reponse["success"] == true
  end

  test "confirmation fails for incorrect key" do
    conn = conn() |> post("/confirm", @invalid_confirm)
    {:ok, reponse} = Poison.Parser.parse(~s(#{conn.resp_body}))

    assert json_response(conn, 200)
    assert reponse["success"] == false
  end

  # The next three tests are for resetting passwords.
  # You need to add the reset_token (key) to a user
  # with the email "gladys@mail.com" before running these tests
  test "reset password succeeds for correct key" do
    conn = conn() |> post("/reset", %{user: @valid_reset})

    assert conn.private.phoenix_flash["info"] =~ "successfully confirmed"
    assert redirected_to(conn) == "/"
  end

  @tag :pending
  test "reset password fails for incorrect key" do
    conn = conn() |> post("/reset", %{user: @invalid_reset})    

    assert conn.private.phoenix_flash["error"] =~ "failed"
  end

  @tag :pending
  test "reset password fails for invalid password" do
    conn = conn() |> post("/confirm", @invalid_pass)
    {:ok, reponse} = Poison.Parser.parse(~s(#{conn.resp_body}))

    assert json_response(conn, 200)
    assert reponse["success"] == false
  end

end
