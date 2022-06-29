defmodule Ieye.Ecto.Place do
    
    alias Ieye.Repo
    alias Ieye.Schema.Place

  def list_places() do
    Repo.all(Place)
    |> Repo.preload(:users)
  end

  def find_place(id) do
    Repo.get(Place, id)
    |> Repo.preload(:users)
  end

  def create_place(place) do
    %Place{}
    |> Ecto.Changeset.change(place)
    |> Repo.insert
  end

end