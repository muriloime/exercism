module Pangram
  def self.pangram?(sentence)
    sentence.chars.uniq.count == 26 
  end
end
