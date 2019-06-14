class Robot
  LETTERS = ('A'..'Z').to_a
  DIGITS = (0..9).to_a

  attr_reader :name

  def initialize
    reset
  end

  def random_name
    @@id += 1
    (@@letters[@@id / @@digits.count] + @@digits[@@id % @@digits.count])
  end

  def self.forget
    @@letters = LETTERS.repeated_permutation(2).to_a.map(&:join).shuffle
    @@digits  = DIGITS.repeated_permutation(3).to_a.map(&:join).shuffle
    @@id = -1
  end

  def reset
    @name = random_name
  end
end
