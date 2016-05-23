defmodule SportScore.User do
  use SportScore.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :encrypted_password, :string
    field :is_admin, :boolean, default: false

    timestamps
  end
end
