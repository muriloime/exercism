module RailFenceCipher
  module_function

  def encode(phrase, rails)
    zigzag(rails, phrase.chars).join
  end

  def decode(cipher, rails)
    zigzag(rails, 0..cipher.size)
      .zip(cipher.chars)
      .sort.map(&:last)
      .join
  end

  def zigzag(rails, signs)
    num = 0 # necessary for stable sort
    zigzag = ([*0..rails - 1] + [*1..rails - 2].reverse).cycle
    signs.zip(zigzag)
         .sort_by { |_sign, z| num += 1; [z, num] }
         .map(&:first)
  end
end
