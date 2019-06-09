class Scrabble
  POINTS_TABLE = [[%w[A E I O U L N R S T], 1],
                  [%w[D G], 2],
                  [%w[B C M P], 3],
                  [%w[F H V W Y], 4],
                  [%w[K], 5],
                  [%w[J X], 8],
                  [%w[Q Z], 10]].freeze

  LETTER_TO_POINTS = Hash[
                      POINTS_TABLE.flat_map do |letters, score|
                        letters.map { |l| [l, score] }
                      end
                    ]

  def initialize(word)
    @word = word.to_s
  end

  def score
    @word.upcase.scan(/\w/).map(&LETTER_TO_POINTS).sum
  end

  def self.score(word)
    new(word).score
  end
end
