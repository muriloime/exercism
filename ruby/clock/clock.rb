class Clock
  attr_reader :minutes_passed
  MINUTES_IN_DAY = 24 * 60
  MINUTES_IN_HOUR = 60

  def initialize(hour: 0, minute: 0)
    @minutes_passed = Clock.in_minutes(hour: hour, minute: minute)
  end

  def to_s
    format('%02d:%02d', hour, minute)
  end

  def +(other)
    Clock.new(hour: 0, minute: minutes_passed + other.minutes_passed)
  end

  def -(other)
    Clock.new(hour: 0, minute: minutes_passed - other.minutes_passed)
  end

  def ==(other)
    minutes_passed == other.minutes_passed
  end

  def eql?(other)
    self == other
  end

  def hash
    value.hash
  end

  protected

  def self.in_minutes(hour:, minute:)
    (minute + hour * MINUTES_IN_HOUR) % MINUTES_IN_DAY
  end

  def hour
    @minutes_passed / MINUTES_IN_HOUR
  end

  def minute
    @minutes_passed % MINUTES_IN_HOUR
  end
end
