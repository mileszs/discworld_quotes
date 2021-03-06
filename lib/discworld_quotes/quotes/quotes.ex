defmodule DiscworldQuotes.Quotes do
  @moduledoc """
  The Quotes context.
  """

  import Ecto.Query, warn: false
  alias DiscworldQuotes.Repo

  alias DiscworldQuotes.Quotes.Quote

  @doc """
  Returns the list of quotes.

  ## Examples

      iex> list_quotes()
      [%Quote{}, ...]

  """
  def list_quotes do
    Repo.all(Quote)
  end

  @doc """
  Search for quotes based on a provided query, using Postgres full-text search.

  Returns [Quote]
  """
  def search_quotes(query) do
    Quote.search(query)
  end

  @doc """
  Gets a single quote.

  Raises `Ecto.NoResultsError` if the Quote does not exist.

  ## Examples

      iex> get_quote!(123)
      %Quote{}

      iex> get_quote!(456)
      ** (Ecto.NoResultsError)

  """
  def get_quote!(id), do: Repo.get!(Quote, id)

  @doc """
  Gets a single quote at random

  Raises `Ecto.NoResultsError` if the Quote does not exist.

  ## Examples

      iex> get_random_quote!
      %Quote{}

      iex> get_random_quote!
      ** (Ecto.NoResultsError)

  """
  def get_random_quote! do
    (from item in Quote, select: item.id)
    |> Repo.all
    |> Enum.random
    |> get_quote!
  end

  @doc """
  Creates a quote.

  ## Examples

      iex> create_quote(%{field: value})
      {:ok, %Quote{}}

      iex> create_quote(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_quote(attrs \\ %{}) do
    %Quote{}
    |> Quote.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a quote.

  ## Examples

      iex> update_quote(quote, %{field: new_value})
      {:ok, %Quote{}}

      iex> update_quote(quote, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_quote(%Quote{} = quote, attrs) do
    quote
    |> Quote.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Quote.

  ## Examples

      iex> delete_quote(quote)
      {:ok, %Quote{}}

      iex> delete_quote(quote)
      {:error, %Ecto.Changeset{}}

  """
  def delete_quote(%Quote{} = quote) do
    Repo.delete(quote)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking quote changes.

  ## Examples

      iex> change_quote(quote)
      %Ecto.Changeset{source: %Quote{}}

  """
  def change_quote(%Quote{} = quote) do
    Quote.changeset(quote, %{})
  end
end
