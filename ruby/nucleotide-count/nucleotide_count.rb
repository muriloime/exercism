class Nucleotide
  TYPES = %w[A T C G].freeze

  def initialize(dna)
    @dna = dna
  end

  def self.valid?(dna)
    (dna.chars.uniq - TYPES).empty?
  end

  def self.from_dna(dna)
    raise InvalidDna unless valid?(dna)

    new(dna)
  end

  def count(type)
    @dna.chars.count { |nucleotide| nucleotide == type }
  end

  def histogram
    Hash[TYPES.map { |type| [type, count(type)] }]
  end
end

class InvalidDna < ArgumentError
  def initialize(message = 'Invalid DNA value')
    super
  end
end
