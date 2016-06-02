defmodule SportScore.SportTest do
  use SportScore.ModelCase

  alias SportScore.Sport
  alias SportScore.User

  @valid_attrs %{name: "some content", name_system: "some content", user_id: 1}
  @invalid_attrs %{}

  setup do
    userChangeset = User.changeset(%User{}, %{email: "kev@gmil.com", name: "Kevin", encrypted_password: "dsfsdd89afhndsiafnads8csd9"})
    {:ok, user}  = Repo.insert(userChangeset)

    {:ok, data: user}
  end

  test "changeset with valid attributes" do
    changeset = Sport.changeset(%Sport{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Sport.changeset(%Sport{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "name system is unique", %{data: user} do
    params = Map.put(@valid_attrs, :user_id, user.id )
    changeset = Sport.changeset(%Sport{}, params)
    {:ok, firstSport} = Repo.insert(changeset)
    changeset2 = Sport.changeset(%Sport{}, params)
    {:error, secondSport} = Repo.insert(changeset2)

    sports = Repo.all(Sport)
    IO.inspect sports
    assert(length(sports)  == 1)
  end
end
