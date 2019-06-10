class Luhn
  def initialize(id_number)
    @id_number = id_number.delete(' ')
  end

  def digits
    @id_number.scan(/\d/).map(&:to_i)
  end

  def compute_odd(digit)
    (digit * 2).then { |x| x > 9 ? x - 9 : x }
  end

  def only_valid_characters?
    !@id_number.match(/\D/)
  end

  def short_string?
    @id_number.size <= 1
  end

  def split_digits
    even_list.reverse.each_slice(2).to_a.transpose
  end

  def checksum
    even_indices, odd_indices = split_digits
    odd_indices.sum { |x| compute_odd(x) } + even_indices.sum
  end

  def valid?
    return false unless only_valid_characters? && !short_string?

    (checksum % 10).zero?
  end

  def self.valid?(id_number)
    new(id_number).valid?
  end

  private

  def even_list
    if digits.count.odd?
      [0] + digits
    else
      digits
    end
  end
end
