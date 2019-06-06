class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    candidates = (2..@limit).to_a
    (2..@limit).each do |number|
      candidates = candidates.reject do |candidate|
        number != candidate && (candidate % number).zero?
      end
    end
    candidates
  end
end
