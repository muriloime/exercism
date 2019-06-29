class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(day, descriptor)
    start_date = Date.new(@year, @month, 1)
    end_date   = start_date.next_month.prev_day

    candidates = (start_date..end_date).select(&:"#{day}?")

    case descriptor
    when :first
      candidates.first
    when :second
      candidates[1]
    when :third
      candidates[2]
    when :fourth
      candidates[3]
    when :last
      candidates[-1]
    when :teenth
      candidates.select { |x| x.day > 12 && x.day <= 19 }.first
    end
  end
end
