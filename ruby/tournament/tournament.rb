class Tournament
  def self.parse(input)
    MatchHistory.new.tap do |match_history|
      input.split("\n").each do |match|
        home, away, result = match.split(';')
        match_history.add_match(home, away, result)
      end
    end
  end

  def self.tally(input)
    parse(input).then do |match_history|
      TableFormatter.display(match_history.teams)
    end
  end
end

class MatchHistory
  def initialize
    @teams_hash = Hash.new { |hash, key| hash[key] = Team.new(key) }
  end

  def teams
    @teams_hash.values
  end

  def add_match(home, away, result)
    case result
    when 'win'
      @teams_hash[home].win!
      @teams_hash[away].loss!
    when 'draw'
      @teams_hash[home].draw!
      @teams_hash[away].draw!
    when 'loss'
      @teams_hash[home].loss!
      @teams_hash[away].win!
    else
      raise ArgumentError, 'unknown result'
    end
  end
end

module TableFormatter
  attr_reader :teams

  ROW_FORMATTER = "%-30s | %2s | %2s | %2s | %2s | %2s\n".freeze
  HEADER = "Team                           | MP |  W |  D |  L |  P\n".freeze

  def self.display(teams)
    [HEADER, *sort(teams).map { |team| show(team) }].join
  end

  def self.show(team)
    format(ROW_FORMATTER,
           team.name, team.matches,
           team.wins, team.draws,
           team.loses, team.points).to_s
  end

  def self.sort(teams)
    teams.sort_by { |team| [-team.points, team.name] }
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
end
