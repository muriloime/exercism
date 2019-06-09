class TwoBucket
  attr_reader :moves, :goal_bucket, :other_bucket, :goal

  def initialize(size1, size2, goal, start_with)
    one = Bucket.new('one', size1, 0, goal)
    two = Bucket.new('two', size2, 0, goal)
    @goal = goal
    one, two = two, one if start_with == 'two'

    @moves = compute(one, two)
  end

  def compute(one, two)
    if solved = [one, two].find(&:solved?)
      @goal_bucket = solved.name
      @other_bucket = [one, two].map(&:content).sum - goal
      0
    else
      if one.empty?
        one = one.fill
      elsif two.full?
        two = two.dump
      else
        one, two = one.pour(two)
      end
      1 + compute(one, two)
    end
  end
end

class Bucket
  attr_accessor :name, :capacity, :content, :goal

  def initialize(name, capacity, content, goal)
    @name = name
    @capacity = capacity
    @content = content
    @goal = goal
  end

  def excess
    capacity - content
  end

  def fill
    Bucket.new(name, capacity, capacity, goal)
  end

  def dump
    Bucket.new(name, capacity, 0, goal)
  end

  def pour(bucket)
    diff = [content, bucket.excess].min
    [Bucket.new(name, capacity, content - diff, goal),
     Bucket.new(bucket.name, bucket.capacity, bucket.content + diff, bucket.goal)]
  end

  def full?
    content == capacity
  end

  def empty?
    content.zero?
  end

  def solved?
    content == @goal
  end
end
