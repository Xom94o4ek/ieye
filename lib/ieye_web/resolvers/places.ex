defmodule IeyeWeb.Resolvers.Places do

  def list_places(_parent, _args, _resolution) do
    {:ok, Ieye.Ecto.Place.list_places()}
  end

  def find_place(_parent, %{id: id}, _resolution) do
    case Ieye.Ecto.Place.find_place(id) do
      nil ->
        {:error, "Place ID #{id} not found"}
      place ->
        {:ok, place}
    end
  end

  def create_place(_parent, args, _resolution) do
    Ieye.Ecto.Place.create_place(args)
  end

end