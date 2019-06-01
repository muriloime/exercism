module Acronym
  def self.abbreviate(phrase)
    phrase.split(' ').map(&:first)
  end
end
