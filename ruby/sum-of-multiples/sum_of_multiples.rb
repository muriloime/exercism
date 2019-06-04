# frozen_string_literal: true

class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end

  def multiple?(number)
    @factors.any? { |factor| (number % factor).zero? }
  end

  def to(number)
    (1..number - 1).select { |i| multiple?(i) }.sum
  end
end
