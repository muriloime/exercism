class Proverb
  def initialize(*words, qualifier: nil)
    @words = words
    @qualifier = qualifier
  end

  def main_line(word1, word2)
    "For want of a #{word1} the #{word2} was lost."
  end

  def closing_line
    last_words = [@qualifier, @words[0]].compact.join(' ')
    "And all for the want of a #{last_words}."
  end

  def lines
    @words.each_cons(2).map do |word1, word2|
      main_line(word1, word2)
    end
  end

  def to_s
    [*lines, closing_line].join "\n"
  end
end
