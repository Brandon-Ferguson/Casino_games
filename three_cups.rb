class ThreeCups
  def initialize(player)
    @player = player
    get_bet
    game_menu
  end

  def game_menu
    puts
    puts "Welcome to Three Cups!"
    puts "The rules are simple: "
    puts "Guess which cup has the rock under it and double your bet. "
    puts "Would you like to continue? (yes/no)"
    user_input = gets.strip.downcase.to_s

    if user_input == 'yes'
      puts "Shuffling cups around the table... "
      puts "Flipping the rock around... "
      shuffle_rock
      calc_win
    else
      puts "Returning to menu... "
      puts "---------------------"
    end
  end

  def shuffle_rock
    @rock_cup = 1 + rand(3)
  end

  def calc_win
    puts "Is the rock under Cup 1, Cup 2, or Cup 3? (Guess 1, 2, or 3)"
    user_guess = gets.strip.to_i

    if user_guess == @rock_cup
      puts "The rock is under #{@rock_cup}... "
      puts "You win!! Your bet has been doubled."
      @player.change_money((@user_bet * 2))
    else
      puts "The rock is under #{@rock_cup}... "
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