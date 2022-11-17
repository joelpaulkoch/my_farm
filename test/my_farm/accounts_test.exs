defmodule MyFarm.AccountsTest do
  use MyFarm.DataCase

  alias MyFarm.Accounts

  describe "farmers" do
    alias MyFarm.Accounts.Farmer

    import MyFarm.AccountsFixtures

    @invalid_attrs %{name: nil}

    test "list_farmers/0 returns all farmers" do
      farmer = farmer_fixture()
      assert Accounts.list_farmers() == [farmer]
    end

    test "get_farmer!/1 returns the farmer with given id" do
      farmer = farmer_fixture()
      assert Accounts.get_farmer!(farmer.id) == farmer
    end

    test "create_farmer/1 with valid data creates a farmer" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Farmer{} = farmer} = Accounts.create_farmer(valid_attrs)
      assert farmer.name == "some name"
    end

    test "create_farmer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_farmer(@invalid_attrs)
    end

    test "update_farmer/2 with valid data updates the farmer" do
      farmer = farmer_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Farmer{} = farmer} = Accounts.update_farmer(farmer, update_attrs)
      assert farmer.name == "some updated name"
    end

    test "update_farmer/2 with invalid data returns error changeset" do
      farmer = farmer_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_farmer(farmer, @invalid_attrs)
      assert farmer == Accounts.get_farmer!(farmer.id)
    end

    test "delete_farmer/1 deletes the farmer" do
      farmer = farmer_fixture()
      assert {:ok, %Farmer{}} = Accounts.delete_farmer(farmer)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_farmer!(farmer.id) end
    end

    test "change_farmer/1 returns a farmer changeset" do
      farmer = farmer_fixture()
      assert %Ecto.Changeset{} = Accounts.change_farmer(farmer)
    end
  end
end
