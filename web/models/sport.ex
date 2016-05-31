defmodule SportScore.Sport do
  use SportScore.Web, :model

  schema "sports" do
    field :name, :string
    field :name_system, :string
    belongs_to :user, SportScore.User

    timestamps
  end

  @required_fields ~w(name user_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:name, message: "The name of the sport must be at least 3 characters long")
    |> normalize_name()
    |> assoc_constraint(:user)
    |> unique_constraint(:name_system, message: "A similar system name already exists")
  end

  defp normalize_name(changeset) do
    if name = get_change(changeset, :name) do
        normalized_name =
            Regex.replace(~r/[^\w]/iu, name, "")
            |> String.downcase
        put_change(changeset, :normalized_name, normalized_name)
    else
        changeset
    end
  end
end
