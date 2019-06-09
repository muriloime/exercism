module BeerSong
  def self.accord(n, capitalize = false, _paragraph = false)
    if n > 1
      "#{n} bottles"
    elsif n == 1
      "#{n} bottle"
    else
      (capitalize ? 'N' : 'n') + 'o more bottles'
    end
  end

  def self.part(n, paragraph)
    (paragraph ? ' ' : '') +
      if n > 0
        "#{accord(n, true)} of beer on the wall, #{accord(n)} of beer.\n" \
          "Take #{n == 1 ? 'it' : 'one'} down and pass it around, #{accord(n - 1)} of beer on the wall.\n"
      else
        "No more bottles of beer on the wall, no more bottles of beer.\n" \
          "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      end
  end

  def self.recite(start, n)
    (start - n + 1..start).to_a.reverse.map do |i|
      part(i, i != start)
    end.join
  end
end
