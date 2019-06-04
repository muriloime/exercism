# frozen_string_literal: true

module Grains
  def self.square(number)
    raise ArgumentError if (number < 1) || (number > 64)

    2**(number - 1)
  end

  def self.total
    (1..64).map { |x| square(x) }.sum
  end
end
