defmodule MyFarm.FarmsTest do
  use MyFarm.DataCase

  alias MyFarm.Farms

  describe "farms" do
    alias MyFarm.Farms.Farm

    import MyFarm.FarmsFixtures

    @invalid_attrs %{name: nil}

    test "list_farms/0 returns all farms" do
      farm = farm_fixture()
      assert Farms.list_farms() == [farm]
    end

    test "get_farm!/1 returns the farm with given id" do
      farm = farm_fixture()
      assert Farms.get_farm!(farm.id) == farm
    end

    test "create_farm/1 with valid data creates a farm" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Farm{} = farm} = Farms.create_farm(valid_attrs)
      assert farm.name == "some name"
    end

    test "create_farm/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Farms.create_farm(@invalid_attrs)
    end

    test "update_farm/2 with valid data updates the farm" do
      farm = farm_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Farm{} = farm} = Farms.update_farm(farm, update_attrs)
      assert farm.name == "some updated name"
    end

    test "update_farm/2 with invalid data returns error changeset" do
      farm = farm_fixture()
      assert {:error, %Ecto.Changeset{}} = Farms.update_farm(farm, @invalid_attrs)
      assert farm == Farms.get_farm!(farm.id)
    end

    test "delete_farm/1 deletes the farm" do
      farm = farm_fixture()
      assert {:ok, %Farm{}} = Farms.delete_farm(farm)
      assert_raise Ecto.NoResultsError, fn -> Farms.get_farm!(farm.id) end
    end

    test "change_farm/1 returns a farm changeset" do
      farm = farm_fixture()
      assert %Ecto.Changeset{} = Farms.change_farm(farm)
    end
  end
end
