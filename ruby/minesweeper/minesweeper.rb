class Board
  BORDER_CHARACTERS = ['-', '+', '|'].freeze
  BOMB = '*'.freeze
  VOID = ' '.freeze
  ALLOWED_CHARACTERS = BORDER_CHARACTERS + [VOID, BOMB]

  def initialize(input_board)
    @input_board = input_board

    compute_bombs
  end

  def column_size
    @input_board.count
  end

  def row_size
    raise UnmatchingRows if sizes.max != sizes.min

    sizes.min
  end

  def sizes
    @input_board.map(&:size)
  end

  def border?(i, j)
    [i, j].min.zero? ||
      j == row_size - 1 ||
      i == column_size - 1
  end

  def compute_bombs
    @bombs = []
    @input_board.each_with_index.map do |row, i|
      row.chars.each_with_index.map do |char, j|
        @bombs << [i, j] if char == BOMB
        raise ImproperBorder.new(i, j) if border?(i, j) && !BORDER_CHARACTERS.include?(char)
        raise ForbiddenCharacter unless ALLOWED_CHARACTERS.include?(char)
      end.join
    end
  end

  def display(i, j)
    bombs_around = @bombs.count { |x, y| (x - i).abs <= 1 && (y - j).abs <= 1 }
    bombs_around.positive? ? bombs_around : ' '
  end

  def transform
    @input_board.each_with_index.map do |row, i|
      row.chars.each_with_index.map do |char, j|
        char == ' ' ? display(i, j) : char
      end.join
    end
  end

  def self.transform(input_board)
    new(input_board).transform
  end
end

class ImproperBorder < ArgumentError
  def initialize(i, j)
    super("Boarder #{i},#{j} is invalid")
  end
end

class UnmatchingRows < ArgumentError
end

class ForbiddenCharacter < ArgumentError
end
