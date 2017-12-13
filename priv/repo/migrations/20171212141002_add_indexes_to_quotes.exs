defmodule DiscworldQuotes.Repo.Migrations.AddIndexesToQuotes do
  use Ecto.Migration

  def up do
    execute("CREATE INDEX index_quotes_on_value ON quotes USING gin(to_tsvector('english', value))")
    execute("CREATE INDEX index_quotes_on_source ON quotes USING gin(to_tsvector('english', source))")
  end

  def down do
    execute("DROP INDEX index_quotes_on_value")
    execute("DROP INDEX index_quotes_on_source")
  end
end
