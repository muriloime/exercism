module Hamming
  def self.compute(strand1, strand2)
    unless strand1.size == strand2.size
      raise ArgumentError, 'Strand lengths must be identical'
    end

    nucleotides = strand1.chars.zip(strand2.chars)
    nucleotides.count { |n1, n2| n1 != n2 }
  end
end
