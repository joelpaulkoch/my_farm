defmodule MyFarm.Repo.Migrations.RemoveOwnerFromFarms do
  use Ecto.Migration

  def change do
    alter table(:farms) do
      remove :owner
    end
  end
end
