module Acronym
  def self.abbreviate(phrase)
    phrase.split(' ').map{ |word| word[0] }.join.upcase
  end
end
