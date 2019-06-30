class Say
  MAX = 999_999_999_999
  NUMBERS = %w[zero one two three four five six seven eight nine ten
               eleven twelve thirteen fourteen fifteen sixteen seventeen
               eighteen nineteen twenty ].freeze

  TENS = %w[zero ten twenty thirty forty fifty sixty
            seventy eighty ninety].freeze

  DECIMAL = [[1_000_000_000, 'billion'],
             [1_000_000, 'million'],
             [1_000, 'thousand'],
             [100, 'hundred']].freeze

  def initialize(number)
    @number = number
  end

  def in_english(number = @number, show_zero = true)
    return nil if number.zero? && !show_zero
    raise NumberOutsideBoundaries if number.negative? || number > MAX

    if DECIMAL.any? { |v, _| number >= v }
      v, number_name = DECIMAL.find { |v, _| number >= v }
      [in_english(number / v),
       number_name,
       in_english(number % v, false)].compact.join(' ')
    elsif number > 20
      TENS[number / 10] + '-' + in_english(number % 10)
    else
      NUMBERS[number]
    end
  end
end

class NumberOutsideBoundaries < ArgumentError
end
