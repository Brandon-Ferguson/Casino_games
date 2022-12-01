require_relative "cards"
require 'pry'

class Deck
  attr_accessor :cards
  def initialize
    @ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
    @suits = %w(Spades Diamonds Clubs Hearts)
    @cards = []
    generate_deck
  end

  def generate_deck
    @suits.each do |suit|
      @ranks.size.times do |i|
        # Ternary Operator
        color = (suit == 'Spades' || suit == 'Clubs') ? 'Black' : 'Red' 
        @cards << Card.new(@ranks[i], suit, color)
      end
    end
  end

  def shuffle_cards
    @cards.shuffle
  end

  def player_start_seven
    @player_hand = []
    shuffle_cards
    counter = 0
    while counter < 7 
      random_card = @cards.sample
      @player_hand << random_card
      counter += 1 
      @cards.each_with_index do |card, i|
        if random_card == card
          @cards.delete_at(i)
        end
      end
    end
    return @player_hand
  end
  
  def computer_start_seven
    @computer_hand = []
    shuffle_cards
    counter = 0
    while counter < 7 
      random_card = @cards.sample
      @computer_hand << random_card
      counter += 1 
      @cards.each_with_index do |card, i|
        if random_card == card
          @cards.delete_at(i)
        end
      end
    end
    return @computer_hand
  end

  def display_cards
    @cards.shuffle.each do |card|
      puts "#{card.rank} #{card.suit} (#{card.color})"
    end
  end

  def count_deck
    puts "Number of cards in the deck"
    puts "#{@cards.count}"
  end

  def single_draw_card
    @drawn_card = []
    random_card = @cards.sample
      @drawn_card << random_card
      @cards.each_with_index do |card, i|
        if random_card == card
          @cards.delete_at(i)
        end
      end
    return @drawn_card
  end

end
