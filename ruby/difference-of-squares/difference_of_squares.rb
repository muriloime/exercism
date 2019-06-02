# frozen_string_literal: true

class Squares
  def initialize(number)
    @n = number
  end

  def first_n
    (1..@n)
  end

  def square_of_sum
    first_n.sum**2
  end

  def sum_of_squares
    first_n.map { |i| i**2 }.sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
