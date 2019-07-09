class Tournament
  def self.parse(input)
    MatchHistory.new.tap do |match_history|
      input.split("\n").each do |match|
        home, away, result = match.split(';')
        match_history.add_match(home, away, result.to_sym)
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
  INVERSE = { win: :loss,
              loss: :win,
              draw: :draw }.freeze

  def initialize
    @scores = Hash.new { |hash, key| hash[key] = Results.new }
  end

  def add_match(home, away, result)
    @scores[home].add(result)
    @scores[away].add(INVERSE[result.to_sym])
  end
end

class TableFormatter
  attr_reader :scores

  ROW_FORMATTER = "%-30s | %2s | %2s | %2s | %2s | %2s\n".freeze
  HEADER = format(ROW_FORMATTER, 'Team', 'MP', 'W', 'D', 'L', 'P').to_s

  def initialize(match_history)
    @scores = match_history.scores
  end

  def display
    [HEADER, *sorted_scores.map { |k, v| show(v, k) }].join
  end

  def sorted_scores
    scores.sort_by { |k, x| [-x.points, k] }
  end

  def show(result, team)
    format(ROW_FORMATTER, team, result.matches, result.wins, result.draws, result.loses, result.points).to_s
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
    @wins += 1 if result == :win
    @draws += 1 if result == :draw
  end
end
