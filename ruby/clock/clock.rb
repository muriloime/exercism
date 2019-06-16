class Clock
  MINUTES_IN_HOUR = 60
  MINUTES_IN_DAY = 24 * MINUTES_IN_HOUR

  def initialize(hour: 0, minute: 0)
    @minutes_passed = (minute + hour * MINUTES_IN_HOUR) % MINUTES_IN_DAY
  end

  def to_s
    format('%02d:%02d', *(minutes_passed.divmod MINUTES_IN_HOUR))
  end

  def +(other)
    self.class.new(hour: 0, minute: minutes_passed + other.minutes_passed)
  end

  def -(other)
    self.class.new(hour: 0, minute: minutes_passed - other.minutes_passed)
  end

  def hash
    value.hash
  end

  def ==(other)
    minutes_passed == other.minutes_passed
  end

  alias eql? ==

  protected

  attr_reader :minutes_passed
end
