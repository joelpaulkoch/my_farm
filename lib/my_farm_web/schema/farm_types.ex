defmodule MyFarmWeb.Schema.FarmTypes do
  use Absinthe.Schema.Notation

  object :farm do
    field :id, :id
    field :name, :string
    field :farmer, :string
  end
end
