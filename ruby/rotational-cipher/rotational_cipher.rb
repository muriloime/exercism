module RotationalCipher
  ALPHABET = ('a'..'z').to_a.join.freeze

  def self.rotate(phrase, shift)
    ALPHABET.chars.rotate(shift).join.then do |rotated|
      phrase.tr(ALPHABET + ALPHABET.upcase, rotated + rotated.upcase)
    end
  end
end
