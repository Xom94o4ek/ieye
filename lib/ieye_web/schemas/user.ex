defmodule IeyeWeb.Schema.Users do
  use Absinthe.Schema.Notation

  object :user do
    field :id, :id
    field :username, :string
    field :places, list_of(:place)
  end
end