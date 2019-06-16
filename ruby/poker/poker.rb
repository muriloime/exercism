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
  VALUES = [:nothing].freeze
  attr_reader :cards
  def initialize(cards)
    @array = cards
    @cards = cards.map { |card| Card.new(card) }.sort.reverse
  end

  def to_s
    @array
  end

  def <=>(other)
    score <=> other.score
  end

  def score
    if straight? && flush?
      [8, cards.map(&:value)]
    elsif square
      [7, square]
    elsif fullhand
      [6, fullhand]
    elsif flush?
      [5, cards.map(&:value)]
    elsif straight?
      [4, cards.map(&:value)]
    elsif three?
      [3, cards.map(&:value)]
    elsif two_pair?
      [2, cards.map(&:value)]
    elsif one_pair?
      [1, cards.map(&:value)]
    else
      [0, cards.map(&:value)]
    end
  end

  def counts
    cards.group_by(&:value).transform_values(&:count).map(&:last)
  end

  def square
    return unless counts.max == 4

    cards.group_by(&:value).transform_values(&:count).map(&:reverse).sort.reverse
  end

  def fullhand
    return unless counts.max(2) == [3, 2]

    cards.group_by(&:value).transform_values(&:count).map(&:reverse).sort.reverse
  end

  def flush?
    cards.map(&:kind).uniq.count == 1
  end

  def straight?
    if cards.map(&:value) == [14, 5, 4, 3, 2]
      cards.first.as_one!
      @cards = cards.sort.reverse
    end
    cards.map(&:value).each_cons(2).all? { |x, y| x - y == 1 }
  end

  def three?
    counts.max == 3
  end

  def two_pair?
    counts.max(2) == [2, 2]
  end

  def one_pair?
    counts.max == 2
  end
end

class Card
  attr_reader :value, :kind
  CARD_MAP = { 'J' => '11',
               'Q' => '12',
               'K' => '13',
               'A' => '14' }.freeze

  def initialize(card)
    @value, @kind = card.gsub(Regexp.union(CARD_MAP.keys), CARD_MAP)
                        .scan(/(\d+)(\w)/).first
    @value = @value.to_i
  end

  def <=>(other)
    value <=> other.value
  end

  def as_one!
    @value = 1 if value == 14
  end
end
