module Isogram
  def self.isogram?(input)
    cleaned_input = input.gsub(/\W/, '').downcase
    cleaned_input.chars.uniq.count == cleaned_input.size
  end
end
