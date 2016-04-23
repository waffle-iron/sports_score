ExUnit.start

Mix.Task.run "ecto.create", ~w(-r SportScore.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r SportScore.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(SportScore.Repo)

