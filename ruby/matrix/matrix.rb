# frozen_string_literal: true

class Matrix
  attr_reader :rows
  def initialize(string_representation)
    @rows = string_representation
            .split("\n")
            .map do |row|
              row.split(' ')
                 .map(&:to_i)
            end
  end

  def columns
    first_row, *other_rows = rows
    first_row.zip(*other_rows)
  end
end
