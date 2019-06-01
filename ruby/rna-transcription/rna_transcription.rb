# frozen_string_literal: true

module Complement
  DNA_COMPLEMENT = { 'G' => 'C',
                     'C' => 'G',
                     'T' => 'A',
                     'A' => 'U' }.freeze
  def self.of_dna(strand)
    strand.gsub(/[#{DNA_COMPLEMENT.keys.join}]/, DNA_COMPLEMENT)
  end
end
