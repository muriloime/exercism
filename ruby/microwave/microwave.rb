class Formatter
  attr_reader :input
  def initialize(input)
    @input = input
  end

  def timer
    "#{format('%02d', hours)}:#{format('%02d', minutes)}"
  end
end

class MinuteFormatter < Formatter
  def hours
    input / 100
  end

  def minutes
    (input % 100)
  end
end

class HourFormatter < Formatter
  def hours
    input / 60
  end

  def minutes
    input % 60
  end
end

class Microwave
  attr_reader :time
  def initialize(time)
    @time = time
  end

  def formatter
    if time >= 100
      MinuteFormatter.new(time)
    else
      HourFormatter.new(time)
    end
  end
  
  def timer
    formatter.timer
  end
end
