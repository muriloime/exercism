# frozen_string_literal: true

class Anagram
  def initialize(word)
    @word = word.downcase
    @word_counter = character_counter(@word)
  end

  def match(words)
    words.select do |candidate|
      candidate = candidate.downcase
      different?(candidate) && same_letters?(candidate)
    end
  end

  private

  def different?(candidate)
    candidate != @word
  end

  def character_counter(test_word)
    test_word
      .chars
      .group_by(&:itself)
      .transform_values(&:count)
  end

  def same_letters?(candidate)
    character_counter(candidate) == @word_counter
  end
end
