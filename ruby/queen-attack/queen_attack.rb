class Queens
  SQUARES = (0..7).to_a.repeated_permutation(2).to_a

  def initialize(white: nil, black: nil)
    raise ArgumentError if [white, black].compact.any? { |square| !SQUARES.include?(square) }
    raise ArgumentError if black == white

    @white = white
    @black = black
  end

  def attack?
    @white.zip(@black).any? { |x, y| x == y } ||
      (@white.reduce(:-) == @black.reduce(:-)) ||
      (@white.reduce(:+) == @black.reduce(:+))
  end
end
