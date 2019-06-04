# frozen_string_literal: true

module Transpose
  def self.full_matrix(input)
    matrix = input.split("\n").map(&:chars)
    number_columns = matrix.map(&:count).max
    matrix.map { |row| row.to_a.fill(' ', row.count, number_columns - row.count) }
  end

  def self.transpose(input)
    full_matrix(input)
      .transpose
      .map(&:join)
      .map(&:rstrip)
      .join("\n")
  end
end
