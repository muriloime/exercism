# frozen_string_literal: true

# frozen_strand_literal: true

module Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError if strand1.size != strand2.size

    nucleotides = strand1.chars.zip(strand2.chars)
    nucleotides.count { |n1, n2| n1 != n2 }
  end
end
