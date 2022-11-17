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

    @desc "Get farmer by id"
    field :farmer, :farmer do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Account.find_farmer/3)
    end
  end

  mutation do
    @desc "Create a farm"
    field :create_farm, type: :farm do
      arg(:name, non_null(:string))
      arg(:owner, non_null(:string))

      resolve(&Resolvers.Farm.create_farm/3)
    end

    @desc "Create a farmer"
    field :create_farmer, type: :farmer do
      arg(:name, non_null(:string))

      resolve(&Resolvers.Account.create_farmer/3)
    end
  end
end
