defmodule MyFarm.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias MyFarm.Repo

  alias MyFarm.Accounts.Farmer

  @doc """
  Returns the list of farmers.

  ## Examples

      iex> list_farmers()
      [%Farmer{}, ...]

  """
  def list_farmers do
    Repo.all(Farmer)
  end

  @doc """
  Gets a single farmer.

  Raises `Ecto.NoResultsError` if the Farmer does not exist.

  ## Examples

      iex> get_farmer!(123)
      %Farmer{}

      iex> get_farmer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_farmer!(id), do: Repo.get!(Farmer, id)

  @doc """
  Creates a farmer.

  ## Examples

      iex> create_farmer(%{field: value})
      {:ok, %Farmer{}}

      iex> create_farmer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_farmer(attrs \\ %{}) do
    %Farmer{}
    |> Farmer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a farmer.

  ## Examples

      iex> update_farmer(farmer, %{field: new_value})
      {:ok, %Farmer{}}

      iex> update_farmer(farmer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_farmer(%Farmer{} = farmer, attrs) do
    farmer
    |> Farmer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a farmer.

  ## Examples

      iex> delete_farmer(farmer)
      {:ok, %Farmer{}}

      iex> delete_farmer(farmer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_farmer(%Farmer{} = farmer) do
    Repo.delete(farmer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking farmer changes.

  ## Examples

      iex> change_farmer(farmer)
      %Ecto.Changeset{data: %Farmer{}}

  """
  def change_farmer(%Farmer{} = farmer, attrs \\ %{}) do
    Farmer.changeset(farmer, attrs)
  end
end
