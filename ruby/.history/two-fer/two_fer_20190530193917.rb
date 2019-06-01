module TwoFer
  def self.two_fer(name = 'you')
    "One for #{pretty_name(name)}, one for me."
  end
  def self.pretty_name(name)
    name || "you"
  end
end
