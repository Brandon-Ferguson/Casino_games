require_relative "player.rb"
require_relative "casino_games.rb"

class App
  attr_accessor :player

  def initialize
    @player = init_player
  end

  def init_player
    puts "Welcome to the Casino!!"
    puts "Enter your name"
    name = gets.strip
    puts "What is your age?"
    age = gets.strip.to_i
    puts "How much money did you bring?"
    money = gets.strip.to_i

    if age >= 21
      @player = Player.new(name, age, money)
      Main_menu.new(@player)
    else
      puts "Sorry, goodbye!"
      exit
    end
  end
end

app = App.new