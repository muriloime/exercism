# frozen_string_literal: true

class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def char_counter(test_word)
    Hash[test_word
         .chars
         .group_by(&:itself)
         .map { |word| [word, word.count] }]
  end

  def match(words)
    word_counter = char_counter(@word)
    words.select do |candidate|
      normalized_candidate = candidate.downcase
      (normalized_candidate != @word &&
        char_counter(normalized_candidate) == word_counter)
    end
  end
end
