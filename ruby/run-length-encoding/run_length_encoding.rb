module RunLengthEncoding
  def self.encode(input)
    input.gsub(/(\D)\1+/) do |character_chain|
      "#{character_chain.size}#{character_chain[0]}"
    end
  end

  def self.decode(input)
    input.gsub(/(\d+)(\D)/) { Regexp.last_match(2) * Regexp.last_match(1).to_i }
  end
end
