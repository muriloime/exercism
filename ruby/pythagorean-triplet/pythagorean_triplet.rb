# frozen_string_literal: true

class Triplet
  def initialize(a, b, c)
    @sides = [a, b, c].sort
  end

  def sum
    @sides.sum
  end

  def product
    @sides.reduce(:*)
  end

  def pythagorean?
    (@sides[0]**2 + @sides[1]**2 - @sides[2]**2).zero?
  end

  def self.possible_triplets(factor_range)
    factor_range
      .combination(3)
      .map { |triplet| Triplet.new(*triplet) }
  end

  def self.filter(candidates, sum, product)
    candidates.select do |triplet|
      (!sum || triplet.sum == sum) &&
        (!product || triplet.product == product)
    end
  end

  def self.where(min_factor: 1, max_factor:, sum: nil, product: nil)
    all_triplets = possible_triplets((min_factor..max_factor).to_a)
    filter(all_triplets,
           sum,
           product).select(&:pythagorean?)
  end
end
