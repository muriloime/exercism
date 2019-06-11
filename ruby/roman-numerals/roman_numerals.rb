class Integer
  def to_roman
    x = to_i
    return '' if x.zero?
    return 'M' + (x - 1000).to_roman if x >= 1000
    return 'CM' + (x - 900).to_roman if x >= 900
    return 'D' + (x - 500).to_roman if x >= 500
    return 'CD' + (x - 400).to_roman if x >= 400
    return 'C' + (x - 100).to_roman if x >= 100
    return 'XC' + (x - 90).to_roman if x >= 90
    return 'L' + (x - 50).to_roman if x >= 50
    return 'XL' + (x - 40).to_roman if x >= 40
    return 'X' + (x - 10).to_roman if x >= 10
    return 'IX' if x == 9
    return 5.to_roman + (x - 5).to_roman if x > 5

    case x
    when 1, 2, 3
      'I' * x
    when 4
      'IV'
    when 5
      'V'
    end
  end
end
