module CollatzConjecture
  def self.steps(number, step = 0)
    raise ArgumentError if number <= 0
    return step if number == 1

    steps(get_next(number), step + 1)
  end

  def self.get_next(number)
    if number.even?
      number / 2
    else
      3 * number + 1
    end
  end
end

class NegativeStep < ArgumentError
  def initialize
    super('Number must be a positive integer')
  end
end
