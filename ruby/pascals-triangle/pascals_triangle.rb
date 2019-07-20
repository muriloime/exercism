class Triangle
  def initialize(n)
    @n = n
  end

  def next_row(row)
    [0, *row, 0].each_cons(2).map(&:sum)
  end

  def rows
    (2..@n).inject([[1]]) do |rows, _|
      rows + [next_row(rows.last)]
    end
  end
end
