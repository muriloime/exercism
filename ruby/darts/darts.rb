class Darts
  INNER_RANGE = (0..1).freeze
  MIDDLE_RANGE = (1..5).freeze
  OUTER_RANGE = (5..10).freeze

  INNER_POINTS = 10
  MIDDLE_POINTS = 5
  OUTER_POINTS = 1

  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  def radius
    @radius ||= Math.sqrt(x * x + y * y)
  end

  def score
    case radius
    when INNER_RANGE
      INNER_POINTS
    when MIDDLE_RANGE
      MIDDLE_POINTS
    when OUTER_RANGE
      OUTER_POINTS
    else
      0
    end
  end
end
