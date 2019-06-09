require 'prime'

class Prime
  def self.nth(n)
    raise ArgumentError, 'n must be positive' if n <= 0

    new.take(n).last
  end

  def each
    (2..Float::INFINITY).each do |i|
      yield(i) if prime?(i)
    end
  end

  def prime?(n)
    (2..Math.sqrt(n).to_i).none? { |divisor| (n % divisor).zero? }
  end
end
