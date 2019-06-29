class Tournament
  def initialize(input)
    @scores = Hash.new { |hash, key| hash[key] = Results.new }
    input.split("\n").each do |match|
      home, away, result = match.split(';')
      add_match(home, away, result)
    end
  end

  def sorted_scores
    @scores.sort_by { |k, x| [-x.p, k] }
  end

  def tally
    [Results.header, *sorted_scores.map { |k, v| v.tally(k) }].map { |row| row + "\n" }.join
  end

  def add_match(home, away, result)
    @scores[home].home(result)
    @scores[away].away(result)
  end

  def self.tally(input)
    new(input).tally
  end
end

class Results
  attr_reader :mp, :w, :d
  RESULT = { 'win' => 1,
             'loss' => -1,
             'draw' => 0 }.freeze

  def initialize
    @mp = 0
    @w = 0
    @d = 0
  end

  def p
    w * 3 + d
  end

  def l
    mp - w - d
  end

  def home(result)
    add(RESULT[result])
  end

  def away(result)
    add(-RESULT[result])
  end

  def add(result)
    @mp += 1
    if result == 1
      @w += 1
    elsif result.zero?
      @d += 1
    end
  end

  def tally(team)
    Row.display([team, mp, w, d, l, p])
  end

  def self.header
    Row.display(%w[Team MP W D L P])
  end
end

module Row
  def self.display(cells)
    format = [[30, false]] + [[2, true]] * (cells.size - 1)
    cells.zip(format).map do |c|
      Cell.display(*c.flatten)
    end.join(' | ')
  end
end

module Cell
  def self.display(content, size, align_right = true)
    format("%#{align_right ? '' : '-'}#{size}.#{size}s", content).to_s
  end
end
