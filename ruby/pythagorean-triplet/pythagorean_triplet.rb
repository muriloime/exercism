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

  def self.possible_triplets(min_factor, max_factor)
    factors = (min_factor..max_factor).to_a
    every_permutation = factors.product(factors).product(factors)
    triplets = every_permutation.map(&:flatten).map(&:sort).uniq
    triplets.map { |triplet| Triplet.new(*triplet) }
  end

  def self.filter(candidates, sum, product)
    candidates.select do |triplet|
      (!sum || triplet.sum == sum) &&
        (!product || triplet.product == product)
    end
  end

  def self.where(min_factor: 1, max_factor:, sum: nil, product: nil)
    all_triplets = possible_triplets(min_factor, max_factor)
    filter(all_triplets,
           sum,
           product).select(&:pythagorean?)
  end

  private

  def array
    [@a, @b, @c]
  end
end
