class Tournament
  def initialize(input, formatter = TableFormatter)
    @match_history = MatchHistory.new
    @formatter = formatter
    parse(input)
  end

  def parse(input)
    input.split("\n").each do |match|
      home, away, result = match.split(';')
      @match_history.add_match(home, away, result)
    end
  end

  def tally
    @formatter.new(@match_history.scores).display
  end

  def self.tally(input)
    new(input).tally
  end
end

class MatchHistory
  attr_reader :scores

  RESULT = { 'win' => 1,
             'loss' => -1,
             'draw' => 0 }.freeze

  def initialize
    @scores = Hash.new { |hash, key| hash[key] = Results.new }
  end

  def add_match(home, away, result)
    @scores[home].add(RESULT[result])
    @scores[away].add(RESULT[result] * -1)
  end
end

class TableFormatter
  attr_reader :scores

  def initialize(scores)
    @scores = scores
  end

  def display
    [self.class.header, *sorted_scores.map { |k, v| show(v, k) }].join
  end

  def sorted_scores
    scores.sort_by { |k, x| [-x.p, k] }
  end

  def self.header
    RowFormatter.new(%w[Team MP W D L P]).display
  end

  def show(result, team)
    RowFormatter.new([team, result.mp, result.w, result.d, result.l, result.p]).display
  end
end

class RowFormatter
  attr_reader :cells

  def initialize(cells)
    @cells = cells
  end

  def format
    [[30, false]] + [[2, true]] * (cells.size - 1)
  end

  def display
    cells.zip(format).map do |c|
      CellFormatter.display(*c.flatten)
    end.join(' | ') + "\n"
  end
end

module CellFormatter
  def self.display(content, size, align_right = true)
    format("%#{align_right ? '' : '-'}#{size}.#{size}s", content).to_s
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
end
