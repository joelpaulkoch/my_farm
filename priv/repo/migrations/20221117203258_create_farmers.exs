defmodule MyFarm.Repo.Migrations.CreateFarmers do
  use Ecto.Migration

  def change do
    create table(:farmers) do
      add :name, :string

      timestamps()
    end
  end
end
