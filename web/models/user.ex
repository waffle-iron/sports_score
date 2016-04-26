defmodule SportScore.User do
  use SportScore.Web, :model

  schema "users" do
    field :username, :string
    field :email, :string
    field :encrypted_password, :string
    field :is_admin, :boolean, default: false
  end
end
