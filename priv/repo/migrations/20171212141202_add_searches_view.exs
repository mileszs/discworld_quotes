defmodule DiscworldQuotes.Repo.Migrations.AddSearchesView do
  use Ecto.Migration

  def up do
    execute("
      CREATE VIEW quotes_searches AS

      SELECT
        quotes.id AS searchable_id,
        'Quote' AS searchable_type,
        quotes.value AS searchable_field
      FROM quotes

      UNION

      SELECT
        quotes.id AS searchable_id,
        'Quote' AS searchable_type,
        quotes.source AS searchable_field
      FROM quotes
    ")
  end

  def down do
    execute("DROP VIEW searches")
  end
end
