require_relative 'deck'

class Card_Game
  @@deck = Deck.new
  @computer_hand = []
  @player_hand = []
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
      @computer_hand = @@deck.computer_start_seven
      @player_hand = @@deck.player_start_seven
      puts "Lets begin the game!"
      game_start
    end
  end



  def game_start
    puts "What is your guess?"
    player_guess = gets.strip
    compare_player_to_computer_hand(player_guess)

  end

  def compare_player_to_computer_hand(player_guess)
    beginning_count = @player_hand.count
    @computer_hand.each_with_index do |card, i|
      if player_guess == card.rank
        take_card = card
        @player_hand << take_card
        @computer_hand.delete_at(i)
      else
        do_nothing
      end
    end
    if @player_hand.count > beginning_count
      puts "Congrats you gained #{@player_hand.count - beginning_count} cards!"
      puts "Since you go it right go again!"
      game_start
    else
      puts "Sorry, Go-Fish"
    end
    
  end

  def do_nothing
  end


end