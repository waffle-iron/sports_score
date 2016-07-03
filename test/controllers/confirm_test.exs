defmodule SportScore.ConfirmTest do
  use SportScore.ConnCase

  @valid_link "email=gladys%40mail.com&key=pu9-VNdgE8V9qZo19rlcg3KUNjpxuixg"
  @invalid_link "email=gladys%40mail.com&key=pu9-VNdgE8V9QzO19RLCG3KUNjpxuixg"
  @valid_attrs %{email: "gladys@mail.com", password: "^hEsdg*F899",
    key: "pu9-VNdgE8V9qZo19rlcg3KUNjpxuixg"}
  @invalid_attrs %{email: "gladys@mail.com",  password: "^hEsdg*F899",
    key: "pu9-VNDGe8v9QzO19RLCg3KUNjpxuixg"}
  @invalid_pass %{email: "gladys@mail.com", password: "qwerty",
    key: "pu9-VNdgE8V9qZo19rlcg3KUNjpxuixg"}

  # The first two tests are for email confirmation.
  # In this case, you need to add the confirmation_token (key)
  # to a user with the email "gladys@mail.com" before running these tests

  @tag :pending
  test "confirmation succeeds for correct key" do

  end

  @tag :pending
  test "confirmation fails for incorrect key" do

  end

  # The next three tests are for resetting passwords.
  # You need to add the reset_token (key) to a user
  # with the email "gladys@mail.com" before running these tests
  @tag :pending
  test "reset password succeeds for correct key" do

  end

  @tag :pending
  test "reset password fails for incorrect key" do

  end

  @tag :pending
  test "reset password fails for invalid password" do

  end

end
