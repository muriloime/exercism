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
      TableFormatter.new(match_history.teams.values).display
    end
  end
end

class MatchHistory
  attr_reader :teams

  INVERSE = { win: :loss,
              loss: :win,
              draw: :draw }.freeze

  def initialize
    @teams = Hash.new { |hash, key| hash[key] = Team.new(key) }
  end

  def add_match(home, away, result)
    @teams[home].send((result.to_s + '!').to_sym)
    @teams[away].send((INVERSE[result].to_s + '!').to_sym)
  end
end

class TableFormatter
  attr_reader :teams

  ROW_FORMATTER = "%-30s | %2s | %2s | %2s | %2s | %2s\n".freeze
  HEADER = "Team                           | MP |  W |  D |  L |  P\n".freeze

  def initialize(teams)
    @teams = teams
  end

  def display
    [HEADER, *teams.sort.map { |team| show(team) }].join
  end

  def show(team)
    format(ROW_FORMATTER, *team.row_list).to_s
  end
end

class Team
  attr_reader :name, :wins, :draws, :loses

  def initialize(name)
    @name = name
    @wins = @loses = @draws = 0
  end

  def points
    wins * 3 + draws
  end

  def matches
    wins + draws + loses
  end

  def win!
    @wins += 1
  end

  def draw!
    @draws += 1
  end

  def loss!
    @loses += 1
  end

  def row_list
    [name, matches, wins, draws, loses, points]
  end

  def <=>(other)
    [-points, name] <=> [-other.points, other.name]
  end
end
