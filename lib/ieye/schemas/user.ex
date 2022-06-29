defmodule Ieye.Schema.User do
  use Ecto.Schema

  schema "users" do
    field :username, :string

    many_to_many :places, Ieye.Schema.Place, join_through: "users_places", on_replace: :delete
  end
end