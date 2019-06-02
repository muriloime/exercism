# frozen_string_literal: true

class Triangle
  def initialize(sides)
    @sides = sides
  end

  def valid_sides?
    @sides.select(&:positive?).count == 3
  end

  def triangle_inequality?
    a, b, c = @sides.sort
    a + b > c
  end

  def valid?
    valid_sides? && triangle_inequality?
  end

  def matching_sides
    @sides.group_by(&:itself)
          .map { |_side, group| group.count }
          .select { |cnt| cnt > 1 }
          .max.to_i
  end

  def equilateral?
    valid? && matching_sides == 3
  end

  def isosceles?
    valid? && matching_sides >= 2
  end

  def scalene?
    valid? && matching_sides.zero?
  end
end
