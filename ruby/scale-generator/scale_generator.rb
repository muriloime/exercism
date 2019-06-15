# Scale Generator in Ruby
class Scale
  CHROMATIC_SCALE = %w[C C# D D# E F F# G G# A A# B].freeze
  FLAT_SCALE = %w[C Db D Eb E F Gb G Ab A Bb B].freeze
  FLAT_KEYS = %w[F Bb Eb Ab Db Gb d g c f bb eb].freeze
  INTERVAL = { 'm' => 1, 'M' => 2, 'A' => 3 }.freeze

  attr_reader :tonic, :scale_type, :intervals

  def initialize(tonic, scale_type, intervals = nil)
    @tonic = tonic
    @scale_type = scale_type
    if intervals
      @intervals = intervals.chars
                            .map(&INTERVAL)
                            .inject([0]) { |acc, y| acc + [acc.last + y] }
    end
  end

  def name
    "#{tonic.upcase} #{scale_type}"
  end

  def pitches
    if @intervals
      intervals.map { |i| scale[i] }.compact
    else
      scale
    end
  end

  private

  def flat?
    FLAT_KEYS.include?(tonic)
  end

  def scale
    (flat? ? FLAT_SCALE : CHROMATIC_SCALE).then do |scale|
      scale.rotate(scale.index(capital))
    end
  end

  def capital
    tonic.capitalize
  end
end
