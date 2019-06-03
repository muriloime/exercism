# frozen_string_literal: true

class Phrase
  def initialize(string)
    @string = string
  end

  def words
    @string.scan(/[[:alnum:]]+(?:'[[:alnum:]]+)*/i).map(&:downcase)
  end

  def word_count
    Hash[words.group_by(&:itself).map { |word, group| [word, group.count] }]
  end
end
