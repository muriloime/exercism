module PerfectNumber
  def self.classify(number)
    raise RuntimeError if number <= 0

    sum_of_multiples = (1..number - 1).select { |i| (number % i).zero? }.sum
    if sum_of_multiples > number
      'abundant'
    elsif sum_of_multiples < number
      'deficient'
    else
      'perfect'
    end
  end
end
