class Luhn
  def initialize(id_number)
    @id_number = id_number.delete(' ')
  end

  def valid?
    return false unless only_valid_characters? && !short_string?

    (checksum % 10).zero?
  end

  def self.valid?(id_number)
    new(id_number).valid?
  end

  private

  def digits
    @id_number.scan(/\d/).map(&:to_i)
  end

  def luhn_double(digit)
    (digit * 2).then { |double| double > 9 ? double - 9 : double }
  end

  def do_nothing(digit)
    digit
  end

  def only_valid_characters?
    !@id_number.match(/\D/)
  end

  def short_string?
    @id_number.size <= 1
  end

  def checksum
    digits.reverse.each_slice(2).sum { |a, b = 0| a + luhn_double(b) }
  end
end
