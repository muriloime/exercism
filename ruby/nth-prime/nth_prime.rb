require 'prime'

class Prime
  def self.nth(n)
    raise ArgumentError if n <= 0

    (0..Float::INFINITY).lazy
                        .select(&:prime?)
                        .first(n).last
  end
end
