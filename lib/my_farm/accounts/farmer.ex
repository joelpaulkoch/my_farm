defmodule MyFarm.Accounts.Farmer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "farmers" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(farmer, attrs) do
    farmer
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
