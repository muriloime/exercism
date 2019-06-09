module Isogram
  def self.isogram?(input)
    input.downcase
         .scan(/(\w).*\1/)
         .empty?
  end
end
