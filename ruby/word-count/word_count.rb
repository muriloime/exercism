# frozen_string_literal: true

class Phrase
  REGEXPs = {
    words: /\b[\w']+\b/
  }.freeze

  def initialize(phrase)
    @phrase = phrase
  end

  def words
    @phrase.scan(REGEXPs[:words]).map(&:downcase)
  end

  def word_count
    Hash[words
        .group_by(&:itself)
        .map { |word, group| [word, group.count] }]
  end
end
