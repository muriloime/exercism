module Acronym
  def self.abbreviate(phrase)
    words = phrase.split(/[ -]/)
    first_letters = words.map{ |word| word[0] }
    first_letters.join.upcase
  end
end
