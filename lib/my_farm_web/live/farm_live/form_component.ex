defmodule MyFarmWeb.FarmLive.FormComponent do
  use MyFarmWeb, :live_component

  alias MyFarm.Farms

  @impl true
  def update(%{farm: farm} = assigns, socket) do
    changeset = Farms.change_farm(farm)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"farm" => farm_params}, socket) do
    changeset =
      socket.assigns.farm
      |> Farms.change_farm(farm_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"farm" => farm_params}, socket) do
    save_farm(socket, socket.assigns.action, farm_params)
  end

  defp save_farm(socket, :edit, farm_params) do
    case Farms.update_farm(socket.assigns.farm, farm_params) do
      {:ok, _farm} ->
        {:noreply,
         socket
         |> put_flash(:info, "Farm updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_farm(socket, :new, farm_params) do
    case Farms.create_farm(farm_params) do
      {:ok, _farm} ->
        {:noreply,
         socket
         |> put_flash(:info, "Farm created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
