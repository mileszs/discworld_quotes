defmodule DiscworldQuotes.Repo.Migrations.AddSearchesView do
  use Ecto.Migration

  def up do
    execute("
      CREATE VIEW searches AS

      SELECT
        quotes.id AS searchable_id,
        'Quote' AS searchable_type,
        quotes.value AS term
      FROM quotes

      UNION

      SELECT
        quotes.id AS searchable_id,
        'Quote' AS searchable_type,
        quotes.source AS term
      FROM quotes
    ")
  end

  def down do
    execute("DROP VIEW searches")
  end
end
