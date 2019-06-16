class Affine
  ALPHABET = ('a'..'z').to_a.join.freeze
  M = ALPHABET.size

  def initialize(a, b)
    @a = a
    @b = b

    raise ArgumentError if coprime?
  end

  def alphabet_code(a, b)
    ALPHABET.chars.map.with_index do |_, i|
      ALPHABET[(a * i + b) % M]
    end.join
  end

  def encode(plaintext)
    plaintext.downcase.scan(/[a-z0-9]/).join.tr(ALPHABET, alphabet_code(@a, @b))
             .scan(/(\w{1,5})/).join(' ')
  end

  def decode(ciphertext)
    @a_inverse = inverse(@a)
    @b_inverse = - @a_inverse * @b
    ciphertext.tr(' ', '').tr(ALPHABET, alphabet_code(@a_inverse, @b_inverse))
  end

  private

  def coprime?
    extended_gcd(@a, M).zip([@a, M]).map { |x| x.reduce(&:*) }.sum != 1
  end

  def inverse(a)
    extended_gcd(a, M).first
  end

  def extended_gcd(a, b)
    return 1, 0 if b.zero?

    q, r = a.divmod b
    s, t = extended_gcd(b, r)

    [t, s - q * t]
  end
end
