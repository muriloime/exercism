module TwelveDays
  GIFTS = ['and a Partridge in a Pear Tree',
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

  module_function

  def song
    gifts = []
    ORDINALS.zip(GIFTS).map do |ordinal, gift|
      gifts << gift
      sentence(ordinal, list(gifts.reverse))
    end.join("\n")
  end

  def sentence(ordinal, gift_list)
    "On the #{ordinal} day of Christmas my true love gave to me: #{gift_list}.\n"
  end

  def list(gifts)
    return gifts[0].gsub(/\Aand /, '') if gifts.count == 1

    gifts.join(', ')
  end
end
