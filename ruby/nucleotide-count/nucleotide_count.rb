class Nucleotide
  TYPES = %w[A T C G].freeze

  def initialize(dna)
    raise InvalidDna unless valid?(dna)

    @dna = dna
  end

  def self.from_dna(dna)
    new(dna)
  end

  def count(type)
    @dna.chars.count(type)
  end

  def histogram
    Hash[TYPES.map { |type| [type, count(type)] }]
  end

  private

  def valid?(dna)
    (dna.chars.uniq - TYPES).empty?
  end
end

class InvalidDna < ArgumentError
  def initialize(message = 'Invalid DNA value')
    super
  end
end
