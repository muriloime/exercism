# frozen_string_literal: true

module Hamming
  def self.compute(string1, string2)
    raise ArgumentError if string1.size != string2.size

    string1.chars.zip(string2.chars).reject { |c1, c2| c1 == c2 }. count
  end
end
