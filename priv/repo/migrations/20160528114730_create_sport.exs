defmodule SportScore.Repo.Migrations.CreateSport do
  use Ecto.Migration

  def change do
    create table(:sports) do
      add :name, :string
      add :name_system, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps
    end
    create index(:sports, [:user_id])
    create unique_index(:sports, [:name_system])

  end
end
