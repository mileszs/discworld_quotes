defmodule DiscworldQuotes.Quotes.Quote do
  use Ecto.Schema
  import Ecto.Changeset
  alias DiscworldQuotes.Quotes.Quote


  schema "quotes" do
    field :source, :string
    field :value, :string

    timestamps()
  end

  @doc false
  def changeset(%Quote{} = quote, attrs) do
    quote
    |> cast(attrs, [:value, :source])
    |> validate_required([:value, :source])
  end
end
