module TwelveDays
  def self.song
    12.times.map do |i|
      Verse.new(i).to_s
    end.join("\n")
  end
end

class Verse
  GIFTS = ['a Partridge in a Pear Tree',
           'two Turtle Doves',
           'three French Hens',
           'four Calling Birds',
           'five Gold Rings',
           'six Geese-a-Laying',
           'seven Swans-a-Swimming',
           'eight Maids-a-Milking',
           'nine Ladies Dancing',
           'ten Lords-a-Leaping',
           'eleven Pipers Piping',
           'twelve Drummers Drumming'].freeze
  ORDINALS = %w[first second third fourth fifth sixth seventh
                eighth ninth tenth eleventh twelfth].freeze

  def initialize(number)
    @number = number
  end
  
  def to_s
    "On the #{ORDINALS[@number]} day of Christmas my true love gave to me: #{to_phrase(gift_list)}.\n"
  end

  def gift_list
    GIFTS[0..@number].reverse
  end

  def to_phrase(gifts)
    *init_gifts, last_gift = gifts
    case init_gifts.length
    when 0
      last_gift.to_s
    else
      "#{init_gifts.join(', ')}, and #{last_gift}"
    end
  end
end
