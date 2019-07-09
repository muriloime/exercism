class Tournament
  def self.parse(input)
    MatchHistory.new.tap do |match_history|
      input.split("\n").each do |match|
        home, away, result = match.split(';')
        match_history.add_match(home, away, Result.new(result))
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
    @scores = Hash.new { |hash, key| hash[key] = Results.new(key) }
  end

  def add_match(home, away, result)
    @scores[home].add(result)
    @scores[away].add(result.inverse)
  end
end

class TableFormatter
  attr_reader :scores

  ROW_FORMATTER = "%-30s | %2s | %2s | %2s | %2s | %2s\n".freeze
  HEADER = "Team                           | MP |  W |  D |  L |  P\n".freeze

  def initialize(match_history)
    @scores = match_history.scores
  end

  def display
    [HEADER, *sorted_scores.map { |_, v| show(v) }].join
  end

  def sorted_scores
    scores.sort_by { |_, result| result }
  end

  def show(result)
    format(ROW_FORMATTER, *result.row_list).to_s
  end
end

class Result
  INVERSE = { win: :loss,
              loss: :win,
              draw: :draw }.freeze

  def initialize(value)
    @value = value.to_sym
  end

  def inverse
    self.class.new(INVERSE[@value])
  end

  def win?
    @value == :win
  end

  def draw?
    @value == :draw
  end

  def loss?
    @value == :loss
  end
end

class Results
  attr_reader :name
  def initialize(name)
    @results = []
    @name = name
  end

  def points
    wins * 3 + draws
  end

  def loses
    @results.select(&:loss?).count
  end

  def draws
    @results.select(&:draw?).count
  end

  def wins
    @results.select(&:win?).count
  end

  def matches
    @results.count
  end

  def add(result)
    @results << result
  end

  def row_list
    [name, matches, wins, draws, loses, points]
  end

  def <=>(other)
    [-points, name] <=> [-other.points, other.name]
  end
end
