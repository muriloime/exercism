class Cipher
  ALPHABET = ('a'..'z').to_a

  attr_reader :key
  def initialize(key = generate)
    raise ArgumentError unless key != '' && key.scan(/[a-z]/).count == key.size

    @key = key
    @shift = @key.chars.map { |letter| ALPHABET.index(letter) }
  end

  def encode(text, sign = 1)
    text.chars.zip(@shift).map do |letter, shift|
      idx = ALPHABET.index(letter)
      ALPHABET.rotate(sign * shift)[idx]
    end.join
  end

  def decode(text)
    encode(text, -1)
  end

  def generate
    100.times.map { ALPHABET.sample }.join
  end
end
