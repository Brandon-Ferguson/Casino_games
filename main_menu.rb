require_relative "three_cups"
require_relative "card_deck"
require_relative "dice_game"
require_relative "rock_paper_scissors"


class Main_menu

  attr_accessor :player
  
  def initialize(player)
    @player = player
    main_menu
  end
  
  def main_menu
    puts "\n" * 2
    puts "Hello Welcome to our casino #{player.name}"
    puts ""
    puts "Here, we will place bets, if you lose the game you lose your bet. but if you win we give you double"
    puts "current balance = #{@player.money}"
    puts "Please select one of the following games: "
    puts "1) Rock, Paper, Scissors"
    puts "2) Dice"
    puts "3) Cards"
    puts "4) Three Cups"
    puts "5) Exit Casino"

    user_choice = gets.strip.to_i

    case user_choice
    when 1
      Rock_paper_scissors.new(@player)
    when 2
      dice_game
    when 3
      Card_Game.new(@player)
    when 4
      three_cups
    when 5
      puts "Goodbye!"
      exit
    else
      puts "Invalid Selection, Please Try Again"
      main_menu
    end
  end  

  def rock_paper_scissors
    
  end

  def dice_game
    game = Dice.new(@player)
    main_menu
  end

  def card_game
    puts "I'm working!"
  end

  def three_cups  
    game = ThreeCups.new(@player)
    main_menu
  end
end