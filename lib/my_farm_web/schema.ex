defmodule MyFarmWeb.Schema do
  use Absinthe.Schema
  import_types(MyFarmWeb.Schema.FarmTypes)
  import_types(MyFarmWeb.Schema.AccountTypes)

  alias MyFarmWeb.Resolvers

  query do
    @desc "Get all farms"
    field :farms, list_of(:farm) do
      resolve(&Resolvers.Farm.list_farms/3)
    end

    @desc "Get all farmers"
    field :farmers, list_of(:farmer) do
      resolve(&Resolvers.Account.list_farmers/3)
    end
  end
end
