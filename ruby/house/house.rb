module House
  VERSES = ['This is the horse and the hound and the horn',
            'that belonged to the farmer sowing his corn',
            'that kept the rooster that crowed in the morn',
            'that woke the priest all shaven and shorn',
            'that married the man all tattered and torn',
            'that kissed the maiden all forlorn',
            'that milked the cow with the crumpled horn',
            'that tossed the dog',
            'that worried the cat',
            'that killed the rat',
            'that ate the malt',
            'that lay in the house that Jack built.'].freeze

  module_function

  def recite
    last_verse.downto(0).map do |i|
      stanza(i)
    end.join("\n")
  end

  def last_verse
    (VERSES.size - 1)
  end

  def first_verse(i)
    'This is ' + VERSES[i].scan(/the.*/).join
  end

  def stanza(i)
    ([first_verse(i)] + VERSES[i + 1..last_verse]).join("\n") + "\n"
  end
end
