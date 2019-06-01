module Acronym
  def self.abbreviate(phrase)
    # words = phrase.match(/\b[a-zA-Z]/)
    # first_letters = words.map{ |word| word[0] }
    
    phrase.scan(/\b[a-zA-Z]/)#.join.upcase
  end
end
