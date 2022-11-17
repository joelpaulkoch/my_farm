defmodule MyFarm.FarmsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyFarm.Farms` context.
  """

  @doc """
  Generate a farm.
  """
  def farm_fixture(attrs \\ %{}) do
    {:ok, farm} =
      attrs
      |> Enum.into(%{
        name: "some name",
        owner: "some owner"
      })
      |> MyFarm.Farms.create_farm()

    farm
  end
end
