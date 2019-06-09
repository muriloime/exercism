class Alphametics
  LETTERS = /[A-Z]/.freeze
  DIGITS = (0..9).to_a

  attr_reader :puzzle

  def initialize(puzzle)
    @puzzle = puzzle
  end

  def solve
    permutations.map { |values| Hash[unknowns.zip(values)] }
                .find do |map|
      solved?(map)
    end || {}
  end

  def solved?(map)
    candidate = puzzle.gsub LETTERS, map
    !candidate.match(/(\s|\A)0/) && eval(candidate)
  end

  def self.solve(puzzle)
    new(puzzle).solve
  end

  private

  def permutations
    DIGITS.permutation(unknowns.length)
  end

  def unknowns
    @unknowns ||= puzzle.scan(LETTERS).uniq
  end

  def zero_possible
    @zero_possible ||= (0..unknowns.length).to_a -
                       puzzle.scan(/(\s|\A)\w/)
                             .uniq
                             .map { |letter| unknowns.index(letter) }
  end
end
