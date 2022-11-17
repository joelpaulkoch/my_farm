defmodule MyFarmWeb.Resolvers.Farm do
  def list_farms(_parent, _args, _resolution) do
    {:ok, MyFarm.Farms.list_farms()}
  end

  def create_farm(_parent, args, _resolution) do
    MyFarm.Farms.create_farm(args)
  end
end
