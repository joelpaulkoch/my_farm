defmodule MyFarmWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation

  @desc "A farmer"
  object :farmer do
    field :id, :id
    field :name, :string
    field :farms, list_of(:farm)
  end
end
