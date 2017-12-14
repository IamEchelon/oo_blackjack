require_relative 'dealer'
require_relative 'player'
require "pry"

class Game

  def initialize
    @player = Player.new("Brent")
    @dealer = Dealer.new("Dealer")
  end

  def self.initial_greeting
    system 'clear'
    puts " Welcome to Blackjack ".center(50,"!")
    puts "Hit enter to begin"
    gets.chomp
  end

  def clear_screen
    system 'clear'
    puts " Welcome to Blackjack ".center(50,"!")
    puts
  end

  def initialize_game
    @dealer.shuffle_deck
    @dealer.receive_cards(@dealer.hit)
    @player.receive_cards(@dealer.hit)
    @dealer.receive_cards(@dealer.hit)
    @player.receive_cards(@dealer.hit)
    @dealer.show_hand
    @player.show_hand
  end

  def game_logic
    until @dealer.total >= 17
        @dealer.receive_cards(@dealer.hit)
    end
  end

  def hit_or_stay
    loop do
      puts "Would you like to hit or stay?"
      answer = gets.chomp
      if answer.downcase == "hit"
        @player.receive_cards(@dealer.hit)
        @player.show_hand
      else
        break
      end
    end
  end

  def compare_hands
    case
    when @player.total > 21 && @dealer.total > 21
      puts " Double Bust! "
    when @player.total > 21
      puts " Player Busts! Dealer wins! ".center(50,"*")
    when @dealer.total > 21
      puts " Dealer Busts! Player Wins! ".center(50,"*")
    when @dealer.total == @player.total
      puts " The game is a tie ".center(50,"*")
    when @player.total == 21
      puts " BLACKJACK! PLAYER WINS! ".center(50,"*")
    when @dealer.total == 21
      puts " Blackjack the Dealer Wins! ".center(50,"*")
    when @player.total > @dealer.total
      puts " Player Wins! ".center(50,"*")
    else
      puts " Dealer Wins! ".center(50,"*")
    end
  end

  def show_totals
    puts @player.show_hand
    puts @dealer.show_full_hand
    puts
    puts "Player Total: #{@player.total} Dealer Total: #{@dealer.total}"
  end

  def play
    clear_screen
    initialize_game
    hit_or_stay
    game_logic
    puts
    compare_hands
    puts
    show_totals
  end
end

Game.initial_greeting
loop do
  Game.new.play
  puts "Would you like to play again? Type yes or press any other key to exit"
  answer = gets.chomp
  break unless answer.downcase == "yes"
end
