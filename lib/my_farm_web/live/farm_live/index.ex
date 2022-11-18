defmodule MyFarmWeb.FarmLive.Index do
  use MyFarmWeb, :live_view

  alias MyFarm.Farms
  alias MyFarm.Farms.Farm

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :farms, list_farms())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Farm")
    |> assign(:farm, Farms.get_farm!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Farm")
    |> assign(:farm, %Farm{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Farms")
    |> assign(:farm, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    farm = Farms.get_farm!(id)
    {:ok, _} = Farms.delete_farm(farm)

    {:noreply, assign(socket, :farms, list_farms())}
  end

  defp list_farms do
    Farms.list_farms()
  end
end
