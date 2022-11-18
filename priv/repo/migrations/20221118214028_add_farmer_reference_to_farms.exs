defmodule MyFarm.Repo.Migrations.AddOwnerReferenceToFarms do
  use Ecto.Migration

  def change do
    alter table(:farms) do
      add :farmer_id, references(:farmers, validate: false)
    end
  end
end
