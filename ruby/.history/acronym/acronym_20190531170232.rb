module Acronym
  def self.abbreviate(phrase)
    first_letters = phrase.scan(/\b/)
    first_letters.join.upcase
  end
end
