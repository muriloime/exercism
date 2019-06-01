module Acronym
  def self.abbreviate(phrase)
    first_letters = phrase.scan(/\b[a-zA-Z]/)
    first_letters.join.upcase
  end
end
