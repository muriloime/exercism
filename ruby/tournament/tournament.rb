class Tournament
  def initialize(input)
    @match_history = MatchHistory.new
    parse(input)
  end

  def parse(input)
    input.split("\n").each do |match|
      home, away, result = match.split(';')
      @match_history.add_match(home, away, result)
    end
  end

  def tally
    @match_history.tally
  end

  def self.tally(input)
    new(input).tally
  end
end

class MatchHistory
  RESULT = { 'win' => 1,
             'loss' => -1,
             'draw' => 0 }.freeze
  def initialize
    @scores = Hash.new { |hash, key| hash[key] = Results.new }
  end

  def tally
    [Results.header, *sorted_scores.map { |k, v| v.tally(k) }].map { |row| row + "\n" }.join
  end

  def sorted_scores
    @scores.sort_by { |k, x| [-x.p, k] }
  end

  def add_match(home, away, result)
    @scores[home].add(RESULT[result])
    @scores[away].add(RESULT[result] * -1)
  end
end

class Results
  attr_reader :mp, :w, :d

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
