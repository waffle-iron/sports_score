defmodule SportScore.User do
  use SportScore.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :encrypted_password, :string
    field :is_admin, :boolean, default: false

    timestamps
  end

  def changeset(model, params \\ :empty) do
  	model
  	|> cast(params, ~w(name email encrypted_password), [])
  	|> validate_length(:name, min: 3)
    |> unique_constraint(:name,  message: "This name is already being used")
    |> unique_constraint(:email,  message: "This enail is already being used")
  end

  def validate({:ok, _}, user_params) do
    changeset = changeset(%SportScore.User{}, user_params)
    if changeset.valid? do
      {:ok, []}
    else
      {:error, changeset.errors}
    end
  end

   def validate({:error, errors}, user_params) do
     IO.puts "I could do something fancy here. But I won't."
     {:error, errors}
   end
end
