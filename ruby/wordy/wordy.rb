class WordProblem
  OPERATIONS = { 'What is ' => '',
                 '?' => '',
                 'plus' => :+,
                 'minus' => :-,
                 'multiplied by' => :*,
                 'divided by' => :/ }.freeze

  def initialize(question)
    @question = question.gsub(Regexp.union(OPERATIONS.keys), OPERATIONS)
  end

  def answer
    raise ArgumentError unless @question.scan(/[a-zA-Z]/).empty?

    operands = @question.scan(%r{[\w\+\-\*/]+})

    operands[1..-1]
      .each_slice(2)
      .inject(operands[0]) do |last_value, (operator, operand)|
      eval [last_value, operator, operand].join
    end
  end
end
