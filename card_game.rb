require_relative 'deck'

class Card_Game

  @computer_hand = []
  @@deck = Deck.new()

  attr_accessor :player

  def initialize(player)
    game_menu
    @player = player
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
      game_start
    end
  end



  def game_start
    ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
    @@deck.seven_card_hand.each do |card|

      puts "#{card.rank}"

    end
    


    # puts "what is your guess"
    # go_fish_guess = gets.strip
    # ranks.each do |rank|
    #   if go_fish_guess != rank
    #     puts "error, please enter in a correct card"
    #   else
    #     @computer_hand.each_with_index do |card, i|
    #       if go_fish_guess == card[rank]
    #         @player_hand.insert_at(i, card)
    #         @computer_hand.delete_at(i)
    #       end
    #     end
    #   end
    # end
  end
end


