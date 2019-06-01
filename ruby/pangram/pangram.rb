module Pangram
  def self.pangram?(sentence)
    sentence.downcase.gsub(/[^a-z]/i, '').chars.uniq.count == 26 
  end
end
