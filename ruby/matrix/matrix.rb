# frozen_string_literal: true

class Matrix
  attr_reader :rows
  def initialize(string_representation)
    @rows = string_representation
            .each_line
            .map do |row|
              row.split.map(&:to_i)
            end
  end

  def columns
    rows.transpose
  end
end
