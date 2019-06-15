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
    zigzag.first(signs.size)
          .zip(signs)
          .sort_by { |x| num += 1; [x.first, num] }
          .map(&:last)
  end
end
