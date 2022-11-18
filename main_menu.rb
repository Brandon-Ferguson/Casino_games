class Main_menu

  attr_accessor :player
  
  def initialize(player)
    @player = player
    main_menu
  end
  
  def main_menu
    puts "\n" * 2
    puts "Hello Welcome to our casino #{player.name}"
    puts "Please select one of the following games: "
    puts "1) Rock. Paper, Scissors"
    puts "2) Dice"
    puts "3) Cards"
    puts "4) Three Cups"
    puts "5) Exit Casino"

    user_choice = gets.strip.to_i

    case user_choice
    when 1
      rock_paper_scissors
    when 2
      dice_game
    when 3
      card_game
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
    puts "I'm working!"
  end

  def dice_game
    puts "I'm working!"
  end

  def card_game
    puts "I'm working!"
  end

  def three_cups  
    puts "I'm working!"
  end

end