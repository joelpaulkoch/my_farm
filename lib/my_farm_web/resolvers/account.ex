defmodule MyFarmWeb.Resolvers.Account do
  def list_farmers(_parent, _args, _resolution) do
    {:ok, MyFarm.Accounts.list_farmers()}
  end
end
