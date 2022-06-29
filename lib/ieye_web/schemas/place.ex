defmodule IeyeWeb.Schema.Places do
  use Absinthe.Schema.Notation

  object :place do
    field :id, :id
    field :placename, :string
    field :users, list_of(:user)
  end
end