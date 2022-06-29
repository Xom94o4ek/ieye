defmodule Ieye.Ecto.User do
    
    alias Ieye.Repo
    alias Ieye.Schema.User

  def list_users() do
    Repo.all(User)
    |> Repo.preload(:places)
  end

  def find_user(id) do
    Repo.get(User, id)
    |> Repo.preload(:places)
  end

  def create_user(user) do
    %User{}
    |> Ecto.Changeset.change(user)
    |> Repo.insert
  end

  def check_in_user(id, place) do
    user = find_user(id)
    user
    |> Ecto.Changeset.change
    |> Ecto.Changeset.put_assoc(:places, [Ieye.Ecto.Place.find_place(place) | Enum.filter(user.places, fn %{id: id} -> id != String.to_integer(place) end)])
    |> Repo.update
  end

end