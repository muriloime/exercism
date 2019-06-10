# frozen_string_literal: true

class Triplet
  def initialize(*sides)
    raise IncorrectTripletSizeError if sides.count != 3

    @sides = sides
  end

  def sum
    sides.sum
  end

  def product
    sides.reduce(:*)
  end

  def pythagorean?
    a, b, c = sides.sort
    (a**2 + b**2 - c**2).zero?
  end

  def self.where(min_factor: 1, max_factor:, sum: nil, product: nil)
    possible_triplets(min_factor..max_factor)
      .select { |triplet| triplet.satisfy?(sum, product) }
      .select(&:pythagorean?)
  end

  def satisfy?(sum, product)
    (sum.nil? || self.sum == sum) &&
      (product.nil? || self.product == product)
  end

  private

  attr_reader :sides
  class << self
    def possible_triplets(factor_range)
      factor_range.to_a
                  .combination(3)
                  .map { |triplet| Triplet.new(*triplet) }
    end
  end
end

class IncorrectTripletSizeError < ArgumentError
  def initialize
    super('Triplet must have 3 sides')
  end
end
