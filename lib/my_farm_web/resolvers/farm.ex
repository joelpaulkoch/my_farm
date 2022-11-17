defmodule MyFarmWeb.Resolvers.Farm do
  def list_farms(_parent, _args, _resolution) do
    {:ok, MyFarm.Farms.list_farms()}
  end
end
