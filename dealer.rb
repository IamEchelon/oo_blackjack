require_relative 'deck'
require_relative 'player'

class Dealer < Player
  attr_reader :dealer_deck

  def initialize(name)
    super
    @dealer_deck = Deck.new
  end

  def shuffle_deck
    @dealer_deck.deck.shuffle!
  end

  def hit
    @dealer_deck.deck.pop
  end

  def show_hand
  	puts "Dealer shows: "
    puts @player_hand.hand[1]
    puts
  end

  def show_full_hand
    puts "Dealers Hand:"
    puts @player_hand.hand
  end
end
