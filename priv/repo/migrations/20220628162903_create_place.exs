defmodule Ieye.Repo.Migrations.CreatePlace do
  use Ecto.Migration

  def change do
    create table(:places) do
      add :placename, :string
    end
  end
end
