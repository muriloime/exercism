module Brackets
  CLOSE_TO_OPEN = { ')' => '(',
                    '}' => '{',
                    ']' => '[' }.freeze

  OPEN = CLOSE_TO_OPEN.values
  CLOSE = CLOSE_TO_OPEN.keys

  def self.paired?(expression)
    list = []

    expression.chars.each do |c|
      if OPEN.include?(c)
        list.push c
      elsif CLOSE.include?(c)
        return false unless CLOSE_TO_OPEN[c] == list.pop
      end
    end
    list.empty?
  end
end
