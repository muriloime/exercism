class Meetup
  ORDINALS = %i[first second third fourth].freeze
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(day, descriptor)
    start_date = Date.new(@year, @month, 1)
    end_date   = start_date.next_month.prev_day

    candidates = (start_date..end_date).select(&:"#{day}?")

    case descriptor
    when *ORDINALS
      candidates[ORDINALS.index(descriptor)]
    when :last
      candidates[-1]
    when :teenth
      candidates.select { |x| x.day > 12 && x.day <= 19 }.first
    end
  end
end
