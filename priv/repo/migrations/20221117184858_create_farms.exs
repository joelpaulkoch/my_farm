defmodule MyFarm.Repo.Migrations.CreateFarms do
  use Ecto.Migration

  def change do
    create table(:farms) do
      add :name, :string
      add :owner, :string

      timestamps()
    end
  end
end
