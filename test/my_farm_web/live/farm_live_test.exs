defmodule MyFarmWeb.FarmLiveTest do
  use MyFarmWeb.ConnCase

  import Phoenix.LiveViewTest
  import MyFarm.FarmsFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  defp create_farm(_) do
    farm = farm_fixture()
    %{farm: farm}
  end

  describe "Index" do
    setup [:create_farm]

    test "lists all farms", %{conn: conn, farm: farm} do
      {:ok, _index_live, html} = live(conn, Routes.farm_index_path(conn, :index))

      assert html =~ "Listing Farms"
      assert html =~ farm.name
    end

    test "saves new farm", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.farm_index_path(conn, :index))

      assert index_live |> element("a", "New Farm") |> render_click() =~
               "New Farm"

      assert_patch(index_live, Routes.farm_index_path(conn, :new))

      assert index_live
             |> form("#farm-form", farm: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#farm-form", farm: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.farm_index_path(conn, :index))

      assert html =~ "Farm created successfully"
      assert html =~ "some name"
    end

    test "updates farm in listing", %{conn: conn, farm: farm} do
      {:ok, index_live, _html} = live(conn, Routes.farm_index_path(conn, :index))

      assert index_live |> element("#farm-#{farm.id} a", "Edit") |> render_click() =~
               "Edit Farm"

      assert_patch(index_live, Routes.farm_index_path(conn, :edit, farm))

      assert index_live
             |> form("#farm-form", farm: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#farm-form", farm: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.farm_index_path(conn, :index))

      assert html =~ "Farm updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes farm in listing", %{conn: conn, farm: farm} do
      {:ok, index_live, _html} = live(conn, Routes.farm_index_path(conn, :index))

      assert index_live |> element("#farm-#{farm.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#farm-#{farm.id}")
    end
  end

  describe "Show" do
    setup [:create_farm]

    test "displays farm", %{conn: conn, farm: farm} do
      {:ok, _show_live, html} = live(conn, Routes.farm_show_path(conn, :show, farm))

      assert html =~ "Show Farm"
      assert html =~ farm.name
    end

    test "updates farm within modal", %{conn: conn, farm: farm} do
      {:ok, show_live, _html} = live(conn, Routes.farm_show_path(conn, :show, farm))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Farm"

      assert_patch(show_live, Routes.farm_show_path(conn, :edit, farm))

      assert show_live
             |> form("#farm-form", farm: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#farm-form", farm: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.farm_show_path(conn, :show, farm))

      assert html =~ "Farm updated successfully"
      assert html =~ "some updated name"
    end
  end
end
