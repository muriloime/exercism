class Change
  def initialize(coins)
    @coins = coins.sort.reverse
    @changes = []
  end

  def changes(value)
    return [] if value.zero?

    @changes[value] ||= begin
      @coins.select { |coin| value >= coin }
            .map { |coin| changes(value - coin).then { |change| change && (change + [coin]) } }
            .compact
            .min_by(&:count)
    end
  end

  def generate(value)
    raise NegativeTargetError if value.negative?
    raise ImpossibleCombinationError if changes(value).nil?

    changes(value)
  end

  def self.generate(coins, value)
    Change.new(coins).generate(value)
  end

  class ImpossibleCombinationError < RuntimeError
  end

  class NegativeTargetError < RuntimeError
  end
end
