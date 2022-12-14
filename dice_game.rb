class Dice
  def initialize(player)
    @player = player
    get_bet
    game_menu
  end

  def game_menu
    puts
    puts "Welcome to the Dice Roller!"
    puts "The rules are simple: "
    puts "Roll a total higher than 8 on 2 die and double your bet... "
    puts "Would you like to continue? (yes/no)"
    user_input = gets.strip.downcase.to_s

    if user_input == 'yes'
      roll
      show_dice
      show_sum
      calc_win
    else
      puts "Returning to menu... "
      puts "---------------------"
    end
  end
  
  def roll
    @die1 = 1 + rand(6)
    @die2 = 1 + rand(6) 
  end
  
  def show_dice
    puts "Die 1: #{@die1}" 
    puts "Die 2: #{@die2}"
    puts
  end
  
  def show_sum
    print "Sum of dice is ", @die1 + @die2, ".\n"
    puts
  end 

  def calc_win
    if @die1 + @die2 > 8
      puts "You win!! Your bet has been doubled."
      @player.change_money((@user_bet * 2))
    else
      puts "You lose! Your bet has been subtracted from your account. "
      @player.change_money(-@user_bet)
    end
  end

  def get_bet
    puts "Your current balance is $#{@player.money}"
    puts "How much would you like to bet?"
    @user_bet = gets.strip.to_i

    if @user_bet <= @player.money
      puts "Valid bet..."
    else
      puts "Invalid bet, please try again."
      puts 
      get_bet
    end
  end
end