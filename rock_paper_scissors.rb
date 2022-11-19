class Rock_paper_scissors

  @player_bet =  0
  attr_accessor :player
  def initialize(player)
    @player = player
    game_menu
  end

  def game_menu
    puts "\n" * 2
    puts "Hello #{player.name}, welcome to rock, paper, scissors"
    puts "would you like to play? yes or no"
    confirm_play = gets.strip.capitalize
    if confirm_play == "No"
      Main_menu.new(@player)
    end
    puts "Time to place your bet"
    @player_bet = gets.strip.to_i
    if @player_bet <= (@player.money)
      start_game
    else
      puts "you do not have enough money to bet this amount"
      puts "you currently have #{@player.money}"
      game_menu
    end
  end

  def start_game
    computer_choice_options = ["Rock", "Paper", "Scissors"]
    puts "\n" * 2
    puts "Now what is you choice? Rock, Paper, or Scissors?"
    player_choice = gets.strip.capitalize
    computer_choice = computer_choice_options.sample
    puts "we choose: #{computer_choice}"
    if player_choice == "Rock"
      if computer_choice == "Scissors"
        puts "Congrats! you win!"
        puts "you have gained $#{@player_bet}"
        @player.change_money(@player_bet * 2)
      elsif computer_choice == "Rock"
        puts "Tie!"
        puts "you neither win or lose"
      else
        puts "Ha, you lose"
        puts "you lost $#{@player_bet}"
        @player.change_money(-(@player_bet))
      end
    elsif player_choice == "Paper"
      if computer_choice == "Rock"
        puts "Congrats! you win!"
        puts "you have gained $#{@player_bet}"
        @player.change_money(@player_bet * 2)
      elsif computer_choice == "Paper"
        puts "Tie!"
        puts "you neither win or lose"
      else
        puts "Ha, you lose"
        puts "you lost $#{@player_bet}"
        @player.change_money(-(@player_bet))
      end
    elsif player_choice == "Scissors"
      if computer_choice == "Paper"
        puts "Congrats! you win!"
        puts "you have gained $#{@player_bet}"
        @player.change_money(@player_bet * 2)
      elsif computer_choice == "Scissors"
        puts "Tie!"
        puts "you neither win or lose"
      else
        puts "Ha, you lose"
        puts "you lost $#{@player_bet}"
        @player.change_money(-(@player_bet))
      end
    else
      puts "not an option - please use 'rock', 'paper', or 'Scissors'"
    end
    game_menu
  end
end

