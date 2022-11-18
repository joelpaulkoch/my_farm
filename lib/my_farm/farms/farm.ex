defmodule MyFarm.Farms.Farm do
  use Ecto.Schema
  import Ecto.Changeset

  alias MyFarm.Accounts.Farmer

  schema "farms" do
    field :name, :string

    belongs_to :farmer, Farmer

    timestamps()
  end

  @doc false
  def changeset(farm, attrs) do
    farm
    |> cast(attrs, [:name, :farmer])
    |> validate_required([:name])
  end
end
