class Poker
  def initialize(hands)
    @hands = hands.map { |hand| Hand.new(hand) }
  end

  def best_hand
    max = @hands.map(&:score).max
    @hands.sort.reverse.take_while { |hand| hand.score == max }.map(&:to_s).reverse
  end
end

class Hand
  attr_reader :cards

  def initialize(cards)
    @original_array = cards
    @cards = cards.map { |card| Card.new(card) }.sort.reverse
    @cards = @cards.rotate(1) if @cards.map(&:value) == [14, 5, 4, 3, 2]
  end

  def to_s
    @original_array
  end

  def <=>(other)
    score <=> other.score
  end

  BEST_HANDS = %i[straight_flush
                  square
                  fullhand
                  flush
                  straight
                  three
                  two_pair
                  one_pair
                  card_high].freeze

  def score
    BEST_HANDS.map.with_index do |hand, i|
      [BEST_HANDS.count - i, send(hand)] if send(hand)
    end.compact.first
  end

  def card_high
    cards.map(&:value)
  end

  def straight_flush
    straight && flush
  end

  def square
    equal_cards [4]
  end

  def fullhand
    equal_cards [3, 2]
  end

  def flush
    return unless cards.map(&:suit).uniq.count == 1

    card_high
  end

  def straight
    return unless cards.map(&:value).each_cons(2).all? { |x, y| [1, -12].include?(x - y) }

    card_high
  end

  def three
    equal_cards [3]
  end

  def two_pair
    equal_cards [2, 2]
  end

  def one_pair
    equal_cards [2]
  end

  def equal_cards(equals)
    counts = cards.group_by(&:value).transform_values(&:count)
    return unless counts.map(&:last).max(equals.count) == equals

    counts.map(&:reverse).sort.reverse
  end
end

class Card
  attr_reader :rank, :suit
  CARDS = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  def initialize(card)
    @rank, @suit = card.scan(/\b(\w+)([SHCD])\b/).first
  end

  def value
    CARDS.index(@rank) + 2
  end

  def <=>(other)
    value <=> other.value
  end
end
