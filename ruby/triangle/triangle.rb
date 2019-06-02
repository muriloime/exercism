# frozen_string_literal: true

class Triangle
  def initialize(sides)
    @sides = sides
  end

  def valid_sides?
    @sides.select(&:positive?).count == 3
  end

  def triangle_condition?
    a, b, c = @sides.sort
    a + b > c
  end

  def triangle?
    valid_sides? && triangle_condition?
  end

  def max_matching_sides
    @sides.group_by(&:itself)
          .map { |_side, group| group.count }
          .max
  end

  def equilateral?
    triangle? && max_matching_sides == 3
  end

  def isosceles?
    triangle? && max_matching_sides >= 2
  end

  def scalene?
    triangle? && max_matching_sides == 1
  end
end
