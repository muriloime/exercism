module Translation
  CODON_TO_PROTEIN = { 'AUG' =>	'Methionine',
                       'UUU' => 'Phenylalanine',
                       'UUC' => 'Phenylalanine',
                       'UUA' => 'Leucine',
                       'UUG' => 'Leucine',
                       'UCU' => 'Serine',
                       'UCC' => 'Serine',
                       'UCA' => 'Serine',
                       'UCG' => 'Serine',
                       'UAU' => 'Tyrosine',
                       'UAC' => 'Tyrosine',
                       'UGU' => 'Cysteine',
                       'UGC' => 'Cysteine',
                       'UGG'	=> 'Tryptophan',
                       'UAA' =>	'STOP',
                       'UAG' =>	'STOP',
                       'UGA' =>	'STOP' }.freeze

  def self.of_codon(codon)
    CODON_TO_PROTEIN[codon]
  end

  def self.of_rna(strand)
    codons = strand.scan(/.../)
    raise InvalidCodonError unless (codons - valid_codons).empty?

    codons.map(&CODON_TO_PROTEIN)
          .take_while { |protein| protein != 'STOP' }
  end

  def self.valid_codons
    CODON_TO_PROTEIN.keys
  end
end

class InvalidCodonError < ArgumentError
end
