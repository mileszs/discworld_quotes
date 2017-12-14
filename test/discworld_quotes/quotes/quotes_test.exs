defmodule DiscworldQuotes.QuotesTest do
  use DiscworldQuotes.DataCase

  alias DiscworldQuotes.Quotes

  describe "quotes" do
    alias DiscworldQuotes.Quotes.Quote

    @valid_attrs %{source: "some source", value: "some value"}
    @valid_attrs2 %{source: "a source", value: "a value"}
    @valid_attrs3 %{source: "different", value: "differenter"}
    @update_attrs %{source: "some updated source", value: "some updated value"}
    @invalid_attrs %{source: nil, value: nil}

    def quote_fixture(attrs \\ %{}) do
      {:ok, quote} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Quotes.create_quote()

      quote
    end

    test "list_quotes/0 returns all quotes" do
      quote = quote_fixture()
      assert Quotes.list_quotes() == [quote]
    end

    test "search_quotes/1 returns matching quotes" do
      quote_fixture()
      quote_fixture(@valid_attrs2)
      quote_fixture(@valid_attrs3)
      assert [%Quote{source: "some source"}, %Quote{source: "a source"}] = Quotes.search_quotes("source")
    end

    test "get_quote!/1 returns the quote with given id" do
      quote = quote_fixture()
      assert Quotes.get_quote!(quote.id) == quote
    end

    test "create_quote/1 with valid data creates a quote" do
      assert {:ok, %Quote{} = quote} = Quotes.create_quote(@valid_attrs)
      assert quote.source == "some source"
      assert quote.value == "some value"
    end

    test "create_quote/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Quotes.create_quote(@invalid_attrs)
    end

    test "update_quote/2 with valid data updates the quote" do
      quote = quote_fixture()
      assert {:ok, quote} = Quotes.update_quote(quote, @update_attrs)
      assert %Quote{} = quote
      assert quote.source == "some updated source"
      assert quote.value == "some updated value"
    end

    test "update_quote/2 with invalid data returns error changeset" do
      quote = quote_fixture()
      assert {:error, %Ecto.Changeset{}} = Quotes.update_quote(quote, @invalid_attrs)
      assert quote == Quotes.get_quote!(quote.id)
    end

    test "delete_quote/1 deletes the quote" do
      quote = quote_fixture()
      assert {:ok, %Quote{}} = Quotes.delete_quote(quote)
      assert_raise Ecto.NoResultsError, fn -> Quotes.get_quote!(quote.id) end
    end

    test "change_quote/1 returns a quote changeset" do
      quote = quote_fixture()
      assert %Ecto.Changeset{} = Quotes.change_quote(quote)
    end
  end
end
