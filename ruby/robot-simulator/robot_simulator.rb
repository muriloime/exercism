class Robot
  DIRECTIONS = %i[north east south west].freeze
  COORD_CHANGES = { north: [0, 1],
                    east: [1, 0],
                    south: [0, -1],
                    west: [-1, 0] }.freeze

  attr_accessor :bearing, :coordinates
  def initialize
    @bearing = nil
  end

  def orient(direction)
    raise ArgumentError unless DIRECTIONS.include?(direction)

    @bearing = direction
  end

  def directions
    DIRECTIONS.rotate(DIRECTIONS.index(@bearing))
  end

  def turn_right
    @bearing = directions[1]
  end

  def turn_left
    @bearing = directions[-1]
  end

  def at(x, y)
    @coordinates = x, y
  end

  def advance
    @coordinates = @coordinates.zip(COORD_CHANGES[@bearing]).map(&:sum)
  end
end

class Simulator
  MAP = { 'R' => :turn_right,
          'L' => :turn_left,
          'A' => :advance }.freeze

  def instructions(word)
    word.chars.map { |x| (MAP[x]) }
  end

  def evaluate(robot, word)
    instructions(word).each { |x| robot.send(x) }
  end

  def place(robot, x:, y:, direction:)
    robot.bearing = direction
    robot.coordinates = x, y
  end
end
