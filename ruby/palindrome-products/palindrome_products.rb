class Palindromes

  def initialize(max_factor:, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
  end

  def range
    (@min_factor..@max_factor).to_a
  end

  def factors
    range.repeated_combination(2)
  end

  def grouped_factors
    factors.group_by { |pair| pair.reduce(&:*) }
  end

  def largest
    @palindromes.first
  end

  def smallest
    @palindromes.last
  end

  def generate
    @palindromes = grouped_factors
                   .sort_by { |x, _| -x }
                   .select { |number, _| palindrome?(number) }
                   .map { |number, factors| Palindrome.new(number, factors) }
  end

  def palindrome?(number)
    number.to_s.then { |str| str.reverse == str }
  end
end

class Palindrome
  attr_reader :value, :factors
  def initialize(value, factors)
    @value = value
    @factors = factors
  end
end
