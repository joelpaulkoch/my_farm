defmodule MyFarmWeb.Schema do
  use Absinthe.Schema
  import_types(MyFarmWeb.Schema.FarmTypes)

  alias MyFarmWeb.Resolvers

  query do
    @desc "Get all farms"
    field :farms, list_of(:farm) do
      resolve(&Resolvers.Farm.list_farms/3)
    end
  end
end
