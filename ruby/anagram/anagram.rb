# frozen_string_literal: true

class Anagram
  def initialize(word)
    @word = word
  end

  def char_counter(test_word)
    test_word.downcase.chars.group_by(&:itself).map { |x| [x, x.count] }.sort
  end

  def match(words)
    word_counter = char_counter(@word)
    words.select do |candidate|
      candidate.downcase != @word.downcase && char_counter(candidate) == word_counter
    end
  end
end
