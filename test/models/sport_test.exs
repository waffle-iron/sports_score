defmodule SportScore.SportTest do
  use SportScore.ModelCase

  alias SportScore.Sport

  @valid_attrs %{name: "some content", name_system: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Sport.changeset(%Sport{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Sport.changeset(%Sport{}, @invalid_attrs)
    refute changeset.valid?
  end
end
