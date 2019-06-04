# frozen_string_literal: true

require_relative '../matrix/matrix'

class Matrix
  def grid
    (0..(@rows.count - 1)).to_a.product((0..(columns.count - 1)).to_a)
  end

  def saddle_points
    grid.map do |i, j|
      value = @rows[i][j]
      [i, j] if @rows[i].max == value && columns[j].min == value
    end.compact
  end
end
