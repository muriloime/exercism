class Tournament
  RESULT = { 'win' => 1,
             'loss' => -1,
             'draw' => 0 }.freeze

  def self.parse(input)
    MatchHistory.new.tap do |match_history|
      input.split("\n").each do |match|
        home, away, result = match.split(';')
        match_history.add_match(home, away, RESULT[result])
      end
    end
  end

  def self.tally(input)
    parse(input).then do |match_history|
      TableFormatter.new(match_history).display
    end
  end
end

class MatchHistory
  attr_reader :scores

  def initialize
    @scores = Hash.new { |hash, key| hash[key] = Results.new }
  end

  def add_match(home, away, result)
    @scores[home].add(result)
    @scores[away].add(-result)
  end
end

class TableFormatter
  attr_reader :scores

  def initialize(match_history)
    @scores = match_history.scores
  end

  def display
    [self.class.header, *sorted_scores.map { |k, v| show(v, k) }].join
  end

  def sorted_scores
    scores.sort_by { |k, x| [-x.points, k] }
  end

  def self.header
    RowFormatter.new(%w[Team MP W D L P]).display
  end

  def show(result, team)
    RowFormatter.new([team, result.matches, result.wins, result.draws, result.loses, result.points]).display
  end
end

class RowFormatter
  attr_reader :cells

  FORMAT = [[30, false]].to_enum + [[2, true]].cycle

  def initialize(cells)
    @cells = cells
  end

  def display
    cells.zip(FORMAT).map do |content, *format|
      CellFormatter.new(content, *format.flatten).display
    end.join(' | ') + "\n"
  end
end

class CellFormatter
  def initialize(content, size, align_right = true)
    @content = content
    @size = size
    @align_sign = align_right ? '+' : '-'
  end

  def display
    format("%#{@align_sign}#{@size}.#{@size}s", @content).to_s
  end
end

class Results
  attr_reader :matches, :wins, :draws

  def initialize
    @matches = 0
    @wins = 0
    @draws = 0
  end

  def points
    wins * 3 + draws
  end

  def loses
    matches - wins - draws
  end

  def add(result)
    @matches += 1
    if result == 1
      @wins += 1
    elsif result.zero?
      @draws += 1
    end
  end
end
