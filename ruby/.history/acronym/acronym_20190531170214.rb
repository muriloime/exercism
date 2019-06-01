module Acronym
  def self.abbreviate(phrase)
    first_letters = phrase.scan(/\b\:alpha/)
    first_letters.join.upcase
  end
end
