require_relative 'hand'

class Player
  attr_reader :name, :player_hand, :total

  def initialize(name)
    @name = name
    @player_hand = Hand.new
    @total = 0
  end

  def receive_cards(card)
    @player_hand.hand << card
    calculate_hand
    account_for_aces
  end

  def show_hand
    puts "Your Current hand: "
    @player_hand.hand.each { |card| puts card }
    puts "Current Total: #{@total}"
    puts
  end

  def calculate_hand
    @total = 0 # reset count each time
    @player_hand.hand.each { |card| @total += card.value }
  end

  def account_for_aces
    if @total > 21
      @player_hand.hand.each do |card|
        if card.type == "Ace"
          card.value = 1
        end
      end
    end
    calculate_hand
  end
end
