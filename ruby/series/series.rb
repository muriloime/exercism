# frozen_string_literal: true

class Series
  def initialize(digits_string)
    @value = digits_string
  end

  def slices(size)
    raise ArgumentError if size > @value.size

    @value.chars.each_cons(size).map(&:join)
  end
end
