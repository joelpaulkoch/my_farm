defmodule MyFarm.Farms.Farm do
  use Ecto.Schema
  import Ecto.Changeset

  schema "farms" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(farm, attrs) do
    farm
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
