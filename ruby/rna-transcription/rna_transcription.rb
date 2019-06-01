# frozen_string_literal: true

module Complement
  DNA_COMPLEMENT = { 'G' => 'C',
                     'C' => 'G',
                     'T' => 'A',
                     'A' => 'U' }.freeze
  def self.of_dna(strand)
    strand.chars.map { |nucleotide| DNA_COMPLEMENT[nucleotide] }.join
  end
end
