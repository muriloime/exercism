module TwelveDays
  GIFTS = ['a Partridge in a Pear Tree',
           'two Turtle Doves, and',
           'three French Hens,',
           'four Calling Birds,',
           'five Gold Rings,',
           'six Geese-a-Laying,',
           'seven Swans-a-Swimming,',
           'eight Maids-a-Milking,',
           'nine Ladies Dancing,',
           'ten Lords-a-Leaping,',
           'eleven Pipers Piping,',
           'twelve Drummers Drumming,'].freeze
  ORDINALS = %w[first second third fourth fifth sixth seventh
                eighth ninth tenth eleventh twelfth].freeze

  def self.song
    (0..ORDINALS.count - 1).map do |i|
      verse(i)
    end.join("\n")
  end

  private

  class << self
    def verse(n)
      gift_list = GIFTS[0..n].reverse.join(' ')
      "On the #{ORDINALS[n]} day of Christmas my true love gave to me: #{gift_list}.\n"
    end
  end
end
