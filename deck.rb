require_relative 'card'
require "pry"

class Deck
  SUITS = %w[Hearts Diamonds Spade Clubs]
  CARD_TYPE = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]


  attr_reader :deck

  def initialize
    @deck = []
    SUITS.each do |suit|
      CARD_TYPE.each do |type|
        @value = VALUES.shift
        @deck << Card.new(suit, type, @value)
      end
    end
  end
end

some_deck = Deck.new
puts some_deck.deck
