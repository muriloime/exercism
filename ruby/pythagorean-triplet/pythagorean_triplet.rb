# frozen_string_literal: true

class Triplet
  def initialize(a, b, c)
    @a, @b, @c = [a, b, c].sort
  end

  def sum
    array.sum
  end

  def product
    array.reduce(:*)
  end

  def pythagorean?
    (@a**2 + @b**2 - @c**2).zero?
  end

  def self.candidates(min_factor:, max_factor:, sum:, product:)
    factors = (min_factor..max_factor).to_a
    candidates = factors.product(factors).product(factors).map(&:flatten).map(&:sort).uniq
    candidates.map { |triplet| Triplet.new(*triplet) }.select do |triplet|
      ((sum && triplet.sum == sum) || !sum) &&
        ((product && triplet.product == product) || !product)
    end
  end

  def self.where(min_factor: 1, max_factor:, sum: nil, product: nil)
    candidates = self.candidates(min_factor: min_factor,
                                 max_factor: max_factor,
                                 product: product,
                                 sum: sum)
    candidates.select(&:pythagorean?)
  end

  private

  def array
    [@a, @b, @c]
  end
end
