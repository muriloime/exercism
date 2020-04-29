require_relative '../resistor-color/resistor_color'
require_relative '../resistor-color-duo/resistor_color_duo'

class ResistorColorTrio
  def initialize(trio)
    *duo, last = trio
    @value = ResistorColorDuo.value(duo)
    @power = ResistorColor.color_code(last)
  end

  def resistance
    @value * (10**@power)
  end

  def scaled_resistance
    case resistance
    when -999..999
      resistance.to_s + ' ohms'
    when 1_000..999_999
      (resistance / 1000).to_s + ' kiloohms'
    else
      (resistance / 1_000_000).to_s + ' megaohms'
    end
  end

  def label
    "Resistor value: #{scaled_resistance}"
  end
end
