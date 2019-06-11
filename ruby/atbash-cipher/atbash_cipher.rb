module Atbash
  def self.encode(word)
    word.downcase
        .tr('a-z', ('a'..'z').to_a.reverse.join)
        .scan(/\w/)
        .join
        .scan(/(\w{1,5})/)
        .join(' ')
  end
end
