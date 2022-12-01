require_relative 'deck'

class Card_Game
  @@deck = Deck.new
  @computer_hand = []
  @player_hand = []
  @drawn_card = []
  @@player_score = 0
  @@computer_score = 0
  @@ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
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
    puts "Computer score: #{@@computer_score}"
    puts "Player score: #{@@player_score}"
    puts "What is your guess?"
    player_guess = gets.strip
    puts ""
    compare_player_to_computer_hand(player_guess)
    computer_turn
    game_start
  end

  def compare_player_to_computer_hand(player_guess)
    beginning_count = @player_hand.count
    @computer_hand.each_with_index do |card, i|
      if player_guess == card.rank
        @player_hand << card
        @computer_hand.delete_at(i)
      else
        @computer_hand.each_with_index do |info, ind|
          if player_guess == info.rank
            @player_hand << info
            @computer_hand.delete_at(ind)
          end
        end
      end
    end
    if @player_hand.count > beginning_count
      puts "Congrats you gained #{@player_hand.count - beginning_count} cards!"
      evaluate_player_score
      puts "Since you go it right, go again!"
      game_start
    else
      puts "Sorry, Go-Fish"
      @drawn_card = @@deck.single_draw_card
      @player_hand << @drawn_card[0]
      @drawn_card.each do |card|
        if card == nil
          do_nothing
        else
          puts "you have drawn a #{card.rank}"
        end
        evaluate_player_score
        puts "----------------------"
        puts "\n" * 3
      end
    end
    @drawn_card.clear
  end

  def computer_turn
    beginning_count = @computer_hand.count
    computer_guess = @@ranks.sample
    puts "My guess is: #{computer_guess}"
    @player_hand.each_with_index do |card, i|
      if computer_guess == card.rank
        @computer_hand << card
        @player_hand.delete_at(i)
      else
        @player_hand.each_with_index do |info, ind|
          if computer_guess == info.rank
            @computer_hand << info
            @player_hand.delete_at(ind)
          end
        end
      end
    end
    if @computer_hand.count > beginning_count
      puts "Bummer you have lost #{@computer_hand.count - beginning_count}: #{computer_guess}"
      puts "Since we got it right we will go again"
      computer_turn
    else
      puts "Go-fish"
      @drawn_card = @@deck.single_draw_card
      @drawn_card.each do |card|
        if card == nil
          do_nothing
        else
          @computer_hand << @drawn_card[0]
          puts "we have drawn a card, your turn"
        end
      evaluate_computer_score
      @drawn_card.clear
      puts "----------------------"
      puts "\n" * 3
      end
    game_start
    end
  end

  def do_nothing
  end

  def evaluate_player_score
    counter = 0
    @player_hand = @player_hand.sort_by{ |info| info.rank}
    @player_hand.each_with_index do |card, i|
      @player_hand.each do |comp|
        if card.rank == comp.rank
        counter += 1
        if counter == 4
          @@player_score += 1
          puts "Player score has increased by one! you collected four: #{card.rank}s"
          @player_hand.each_with_index do |del1, l|
            @player_hand.each do |del2|
              @player_hand.each do |del3|
                if del3.rank == card.rank
                  @player_hand.delete_at(i)
                else
                  do_nothing
                end
              end
            end
          end
        else
          do_nothing
        end
      else
        counter = 0
        end
      end
    end
  end

  def evaluate_computer_score
    counter = 0
    @computer_hand = @computer_hand.sort_by{ |info| info.rank }
    @computer_hand.each_with_index do |card, i|
      @computer_hand.each do |comp|
        eval_card = comp.rank
        if card.rank == comp.rank
          counter += 1
            if counter == 4
              @@computer_score += 1
              puts "Computer score has increased by one! we collected four: #{card.rank}s"
              @computer_hand.each_with_index do |del1, l|
                @computer_hand.each do |del2|
                  @computer_hand.each do |del3|
                    if del3.rank == card.rank
                      @computer_hand.delete_at(i)
                    else
                      do_nothing
                    end
                  end
                end
              end
            else
              do_nothing
            end
          else
            counter = 0
        end
      end
    end
  end




  end
