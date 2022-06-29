defmodule Ieye.Schema.Place do
  use Ecto.Schema

  schema "places" do
    field :placename, :string
    
    many_to_many :users, Ieye.Schema.User, join_through: "users_places", on_replace: :delete
  end
end