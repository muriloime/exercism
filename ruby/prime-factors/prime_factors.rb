require 'prime'
module PrimeFactors
  def self.for(n, try_divisor = 2)
    return [] if try_divisor > n

    try_divisor += 1 until (n % try_divisor).zero?

    [try_divisor] + self.for(n / try_divisor, try_divisor)
  end
end
