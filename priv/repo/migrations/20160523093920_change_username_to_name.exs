defmodule SportScore.Repo.Migrations.ChangeUsernameToName do
  use Ecto.Migration

  def change do
  	alter table(:users) do
  		remove :username		
  	end
  end
end
