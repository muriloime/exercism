class Game
  BowlingError = Class.new(Exception)

  def initialize
    @pins = []
  end

  def last_frame
    @pins.count == 10
  end

  def new_frame?
    last = @pins.last
    !last || (last.count == 2 || last.flatten == [10]) && !last_frame
  end

  def roll(pins)
    raise BowlingError unless (0..10).include?(pins)

    if new_frame?
      @pins << [[pins]]
    else
      @pins.last << [pins]
    end

    raise BowlingError unless valid?(@pins.last.flatten)
  end

  def valid?(frame, last = last_frame)
    (frame.sum <= 10 && frame.count <= 2) ||
      (last && frame.count <= 3 &&
        (frame[0..1] == [10, 10] ||
          frame[0..1].sum == 10 ||
          (frame[0] == 10 && valid?(frame[1..2].to_a, false))
        )
      )
  end

  def spare?(frame)
    frame.flatten.sum == 10 && frame.flatten.count == 2
  end

  def add_spare_scores
    @pins.each_cons(2) do |pins1, pins2|
      pins1 << pins2.first if spare?(pins1)
    end
  end

  def add_strike_scores
    @pins.map { |x| x[0..1] }.flatten(1).each_cons(3).each do |pins1, pins2, pins3|
      pins1.append(pins2.first, pins3.first) if pins1.first == 10
    end
  end

  def score
    raise BowlingError if @pins.count != 10

    raise BowlingError if valid?(@pins.last.flatten + [0])

    @score ||= begin
      add_spare_scores
      add_strike_scores
      @pins.flatten.sum
    end
  end
end
