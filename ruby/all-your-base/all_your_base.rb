module BaseConverter
  def self.convert(input_base, digits, output_base)
    raise NegativeBaseError if [input_base, output_base].min <= 1

    number = to_integer(input_base, digits)
    to_base(number, output_base)
  end

  def self.to_base(number, output_base)
    output = []
    loop do
      output << number % output_base
      number /= output_base
      break unless number.positive?
    end
    output.reverse
  end

  def self.to_integer(input_base, digits)
    raise InvalidBaseNumber if digits.max.to_i >= input_base || digits.min.to_i.negative?

    digits.reverse.each_with_index.map { |digit, i| digit * input_base**i }.sum
  end
end

class InvalidBaseNumber < ArgumentError
  def initialize
    super('Number has digits not in base')
  end
end

class NegativeBaseError < ArgumentError
  def initialize
    super('base should be greater than 1')
  end
end
