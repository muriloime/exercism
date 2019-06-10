class Clock
  attr_reader :hour, :minute
  TOTAL_HOURS = 24
  TOTAL_MINUTES = 60

  def initialize(hour: 0, minute: 0)
    increment_hour, @minute = minute.divmod TOTAL_MINUTES
    @hour = (hour + increment_hour) % TOTAL_HOURS
  end

  def to_s
    format('%02d:%02d', hour, minute)
  end

  def +(other)
    Clock.new(hour: hour + other.hour,
              minute: minute + other.minute)
  end

  def -(other)
    Clock.new(hour: hour - other.hour,
              minute: minute - other.minute)
  end

  def ==(other)
    hour == other.hour && minute == other.minute
  end
end
