module Raindrops
  def self.convert(number)
    factor_to_output = { 3 => 'Pling',
                         5 => 'Plang',
                         7 => 'Plong' }.freeze

    converted_number = factor_to_output.select do |factor, _output|
      (number % factor).zero?
    end.map(&:last).join

    converted_number.empty? ? number.to_s : converted_number
  end
end
