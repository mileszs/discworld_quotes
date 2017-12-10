defmodule DiscworldQuotes.Repo.Migrations.CreateQuotes do
  use Ecto.Migration

  def change do
    create table(:quotes) do
      add :value, :string, size: 1200
      add :source, :string

      timestamps()
    end

  end
end
