module Raindrops
  FACTOR_TO_OUTPUT = { 3 => 'Pling',
                       5 => 'Plang',
                       7 => 'Plong' }.freeze

  def self.convert(number)
    converted_number = FACTOR_TO_OUTPUT.map do |factor, output|
      output if (number % factor).zero?
    end.join

    converted_number.empty? ? number.to_s : converted_number
  end
end
