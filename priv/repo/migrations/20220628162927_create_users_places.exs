defmodule Ieye.Repo.Migrations.CreateUsersPlaces do
  use Ecto.Migration

  def change do
    create table(:users_places) do
      add :user_id, references(:users)
      add :place_id, references(:places)
    end

    create unique_index(:users_places,[:user_id, :place_id])
  end
end
