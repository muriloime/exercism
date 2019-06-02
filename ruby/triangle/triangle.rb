# frozen_string_literal: true

class Triangle
  def initialize(sides)
    @sides = sides.sort
  end

  def triangle?
    @sides.select(&:positive?).count == 3 &&
      @sides[0] + @sides[1] > @sides[2]
  end

  def equilateral?
    triangle? && @sides.uniq.count == 1
  end

  def isosceles?
    triangle? && @sides.uniq.count <= 2
  end

  def scalene?
    triangle? && @sides.uniq.count == 3
  end
end
