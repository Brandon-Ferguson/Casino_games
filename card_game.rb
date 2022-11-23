require_relative 'deck'

class Card_Game
  @@deck = Deck.new
  attr_accessor :player
  def initialize(player)
    @player = player
    game_menu
  end

  def game_menu
    puts "Hello #{player.name}, Welcome to our card game"
    puts "We will be playing Go-Fish"
    puts ""
    puts "You start with 7 cards and will ask your opponent if they have a certain card (A - King)"
    puts "Once you collect all 4 of those cards you gain a point and they are removed from play"
    puts "The game ends once all the player's hands are empty"
    puts "You can only ask for cards that you have in your hand"
    puts ""
    puts "You ready to play? yes or no?"
    do_i_play = gets.strip
    if do_i_play == "no"
      Main_menu.new(@player)
    else
      @@deck.computer_start_seven
      @@deck.player_start_seven
      puts "Lets begin the game!"
      game_start
    end
  end



  def game_start
    puts "What is your guess?"

    player_guess = gets.strip
    @@deck.compare_player_to_computer_hand(player_guess)



  end
end