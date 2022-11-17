defmodule MyFarm.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyFarm.Accounts` context.
  """

  @doc """
  Generate a farmer.
  """
  def farmer_fixture(attrs \\ %{}) do
    {:ok, farmer} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> MyFarm.Accounts.create_farmer()

    farmer
  end
end
