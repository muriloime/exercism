Cell = Struct.new(:row, :col, :kind, :connected_component)

class Board
  attr_reader :board
  def initialize(board)
    @board = board.map { |x| x.delete(' ') }.map(&:chars)
    # puts @board.map{|r| r.join('')}
    @cells = Array.new(size) { Array.new(@board.first.size) }
  end

  def size 
    @board.count
  end

  def winner
    @board.each_with_index do |line, i|
      line.each_with_index do |kind, j|
        @cells[i][j] = Cell.new(i, j, kind).tap do |cell|
          next unless %w[X O].include?(kind)

          neighbours = [
            (@cells[i - 1][j] if i.positive?),
            (@cells[i - 1][j + 1] if i.positive? && j <= size),
            (@cells[i][j - 1] if j.positive?)
          ].compact.select { |n| n.kind == kind }
          
          cell.connected_component = ([cell] + neighbours.map(&:connected_component)).flatten.compact.uniq
          # puts [i, j, cell.connected_component.count].join(', ')
          cell.connected_component.each do |neighbour|
            neighbour.connected_component = cell.connected_component
          end
        end
      end
    end
2
    return 'O' if top_to_bottom(@cells, 'O')
    return 'X' if top_to_bottom(@cells.transpose, 'X')

    ''
  end

  private

  def top_to_bottom(cells, kind)
    # cells.each { |row| puts row.map { |x| [x&.connected_component&.count.to_i, x&.kind] }.join(',') }
    # puts 'x'

    arr = (cells.first.select { |c| c&.kind == kind }.map(&:connected_component) &
    cells.last.select { |c| c&.kind == kind }.map(&:connected_component)).count
    # print(arr)
    # print('yy')
    arr > 0
  end
end
