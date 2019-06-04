# frozen_string_literal: true

module Grains
  def self.square(number)
    raise ArgumentError if (number < 1) || (number > 64)

    2**(number - 1)
  end

  def self.total(squares = 64)
    2**squares - 1
  end
end
