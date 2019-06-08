class Proverb
  def initialize(*words, qualifier: nil)
    @words = words
    @qualifier = qualifier
  end

  def main_sentence(word1, word2)
    "For want of a #{word1} the #{word2} was lost.\n"
  end

  def last_sentence
    last_words = [@qualifier, @words[0]].compact.join(' ')
    "And all for the want of a #{last_words}."
  end

  def to_s
    @words.each_cons(2).map do |word1, word2|
      main_sentence(word1, word2)
    end.join + last_sentence
  end
end
