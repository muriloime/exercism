module Acronym
  def self.abbreviate(phrase)
    words = phrase.split(/[ -]/)
    words.map{ |word| word[0] }.join.upcase
  end
end
