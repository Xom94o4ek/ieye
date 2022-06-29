defmodule IeyeWeb.Schema do
  use Absinthe.Schema
  import_types IeyeWeb.Schema.Places
  import_types IeyeWeb.Schema.Users

  alias IeyeWeb.Resolvers

  query do

    @desc "Get all places"
    field :places, list_of(:place) do
      resolve &Resolvers.Places.list_places/3
    end

    @desc "Get a place by id"
    field :place, :place do
      arg :id, non_null(:id)
      resolve &Resolvers.Places.find_place/3
    end

    @desc "Get all users"
    field :users, list_of(:user) do
      resolve &Resolvers.Users.list_users/3
    end

    @desc "Get user by id"
    field :user, :user do
      arg :id, non_null(:id)
      resolve &Resolvers.Users.find_user/3
    end

  end

  mutation do

    @desc "Create a place"
    field :create_place, type: :place do
      arg :placename, non_null(:string)
  
      resolve &Resolvers.Places.create_place/3
    end

    @desc "Create user"
    field :create_user, type: :user do
      arg :username, non_null(:string)
  
      resolve &Resolvers.Users.create_user/3
    end

    @desc "Create user"
    field :check_in_user, type: :user do
      arg :id, non_null(:id)
      arg :place, non_null(:id)
  
      resolve &Resolvers.Users.check_in_user/3
    end
  
  end

end
