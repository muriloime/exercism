# frozen_string_literal: true

class Series
  def initialize(digits_string)
    @value = digits_string
  end

  def slices(size)
    str_size = @value.size
    raise ArgumentError if size > str_size

    (0..str_size).map do |i|
      @value[i..i + size - 1] if i + size - 1 < str_size
    end.compact
  end
end
