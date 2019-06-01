# frozen_string_literal: true

class HighScores
  attr_reader :scores
  def initialize(scores)
    @scores = scores
  end

  def latest
    @scores.last
  end

  def personal_best
    personal_top_three
  end

  def personal_top_three
    @scores.sort.reverse.first(3)
  end
end
