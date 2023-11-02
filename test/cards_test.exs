defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  # there are two types of tests we can do in Elixir
  # doctesting and singular tests(unit testing)

  test "create_deck makes 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end
end
