defmodule MyFarmWeb.Resolvers.Account do
  def list_farmers(_parent, _args, _resolution) do
    {:ok, MyFarm.Accounts.list_farmers()}
  end

  def find_farmer(_parent, %{id: id}, _resolution) do
    case MyFarm.Accounts.find_farmer(id) do
      nil -> {:error, "No farmer with id #{id}"}
      farmer -> {:ok, farmer}
    end
  end
end
