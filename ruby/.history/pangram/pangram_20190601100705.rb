module Pangram
  def self.pangram?(sentence)
    sentence.gsubchars.uniq.count == 26 
  end
end
