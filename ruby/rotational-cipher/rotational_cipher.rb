module RotationalCipher
  ALPHABET = 'abcdefghijklmnopqrstuvwxyz'.freeze
  def self.rotate(phrase, shift)
    ALPHABET.chars.rotate(shift).join.then do |rotated|
      phrase.tr(ALPHABET, rotated).tr(ALPHABET.upcase, rotated.upcase)
    end
  end
end
