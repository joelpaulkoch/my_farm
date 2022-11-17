defmodule MyFarm.Farms.Farm do
  use Ecto.Schema
  import Ecto.Changeset

  schema "farms" do
    field :name, :string
    field :owner, :string

    timestamps()
  end

  @doc false
  def changeset(farm, attrs) do
    farm
    |> cast(attrs, [:name, :owner])
    |> validate_required([:name, :owner])
  end
end
