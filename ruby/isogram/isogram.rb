module Isogram
  def self.isogram?(input)
    input.downcase
         .scan(/(\w).*\1/)
         .empty?
  end

  def self.isogram2?(input)
    cleaned_input = input.downcase.scan(/\w/)
    cleaned_input.uniq.count == cleaned_input.count
  end
end
