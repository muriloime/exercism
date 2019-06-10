class Luhn
  def initialize(string)
    @string = string
  end

  def digits
    @string.scan(/\d/).map(&:to_i)
  end

  def compute(digit, to_double)
    if to_double
      (digit * 2).then { |x| x > 9 ? x - 9 : x }
    else
      digit
    end
  end

  def invalid_characters?
    @string.gsub(/[\d ]/, '').empty?
  end

  def short_string?
    @string.gsub(' ', '').size <= 1
  end

  def checksum
    digits.reverse.each_with_index.sum do |digit, idx|
      compute(digit, idx.odd?)
    end
  end

  def valid?
    return false unless invalid_characters? && !short_string?

    (checksum % 10).zero?
  end

  def self.valid?(string)
    new(string).valid?
  end
end
