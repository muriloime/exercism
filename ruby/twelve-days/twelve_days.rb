module TwelveDays
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

  def self.song
    (0..ORDINALS.count - 1).map do |i|
      verse(i)
    end.join("\n")
  end

  private

  class << self
    def to_phrase(gifts)
      *init_gifts, last_gift = gifts
      case init_gifts.length
      when 0
        last_gift.to_s
      else
        "#{init_gifts.join(', ')}, and #{last_gift}"
      end
    end

    def verse(n)
      gifts = GIFTS[0..n].reverse
      "On the #{ORDINALS[n]} day of Christmas my true love gave to me: #{to_phrase(gifts)}.\n"
    end
  end
end
