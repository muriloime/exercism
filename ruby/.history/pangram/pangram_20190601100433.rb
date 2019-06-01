module Pangram 
  def pangram?(sentence)
    sentence.uniq.count  == 26 
  end
end
