module TwoFer
  def self.two_fer(name)
    "One for #{pretty_name}, one for me."
  end
  def self.pretty_name
    name || "you"
  end
end
