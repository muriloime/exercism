module ArmstrongNumbers
  def self.include?(number)
    digits = number.digits
    length = digits.size
    digits.sum { |n| n**length } == number
  end
end
