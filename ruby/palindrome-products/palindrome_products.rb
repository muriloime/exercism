class Palindromes
  attr_reader :largest

  def initialize(max_factor:, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
  end

  def range
    (@min_factor..@max_factor).to_a
  end

  def factors
    range.product(range).map(&:sort).uniq
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
    characters = number.to_s.chars
    characters.reverse == characters
  end
end

class Palindrome
  attr_reader :value, :factors
  def initialize(value, factors)
    @value = value
    @factors = factors
  end
end
