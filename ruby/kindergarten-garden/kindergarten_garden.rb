class Garden
  CHILDREN = %w[alice bob charlie david
                eve fred ginny harriet
                ileana joseph kincaid larry].freeze
  PLANTS = { 'G' => :grass,
             'C' => :clover,
             'R' => :radishes,
             'V' => :violets }.freeze

  def initialize(garden, students = CHILDREN)
    @rows = garden.split("\n").map { |x| x.chars.map(&PLANTS).each_slice(2).to_a }
    @students = students.map(&:downcase).sort
  end

  def method_missing(message)
    idx = @students.index(message.to_s)
    if idx
      @rows[0][idx] + @rows[1][idx]
    else
      super
    end
  end
end
