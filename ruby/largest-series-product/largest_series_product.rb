class Series
  class InvalidDigitSeries < ArgumentError; end
  class InvalidWidth < ArgumentError; end

  def initialize(digits)
    raise InvalidDigitSeries if digits =~ /[^0-9]/

    @digits = digits
  end

  def largest_product(width)
    raise InvalidWidth if (width > @digits.size) || (width < 0)
    return 1 if width.zero?

    @digits.chars
           .map(&:to_i)
           .each_cons(width)
           .map { |x| x.inject(1, &:*) }
           .max
  end
end
