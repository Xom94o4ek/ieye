defmodule IeyeWeb.Resolvers.Users do

  def list_users(_parent, _args, _resolution) do
    {:ok, Ieye.Ecto.User.list_users()}
  end

  def find_user(_parent, %{id: id}, _resolution) do
    case Ieye.Ecto.User.find_user(id) do
      nil ->
        {:error, "User ID #{id} not found"}
      user ->
        {:ok, user}
    end
  end

  def create_user(_parent, args, _resolution) do
    Ieye.Ecto.User.create_user(args)
  end

  def check_in_user(_parent, %{id: id, place: place}, _resolution) do
    cond do
      Ieye.Ecto.User.find_user(id) == nil -> {:error, "User ID #{id} not found"}
      Ieye.Ecto.Place.find_place(place) == nil -> {:error, "Place ID #{place} not found"}
      true -> Ieye.Ecto.User.check_in_user(id, place)
    end
  end

end