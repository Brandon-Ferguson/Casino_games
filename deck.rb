require_relative "cards"

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

  def seven_card_hand
    player_hand = []
    shuffle_cards

    counter = 0
    while counter < 7 
      random_card = shuffle_cards.sample
      player_hand << random_card
      # find index method with ruby > delete random_card
      counter += 1 
      
    end
    return player_hand
  end
end