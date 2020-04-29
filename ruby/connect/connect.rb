class Board
  attr_reader :board
  def initialize(board)
    @board = board.map { |x| x.gsub(' ', '') }.map(&:chars)
  end

  def winner
    if top_to_bottom(board, 'O')
      'O'
    elsif top_to_bottom(board.transpose, 'X')
      'X'
    else
      ''
    end
  end

  def top_to_bottom(board, piece)
    board.inject([true] * board.size) do |x, y|
      valid = x.zip(y.map { |v| v == piece }).map(&:all?)
      valid.zip(valid[1..-1]).map(&:any?)
    end.any?
  end
end
