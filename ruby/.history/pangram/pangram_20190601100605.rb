module Pangram
  def pangram?(sentence)
    sentence.chars.uniq.count == 26 
  end
end
