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
    raise ArgumentError unless @question !~ /[a-zA-Z]/

    operands = @question.scan(%r{[\d\+\-\*/]+})

    operands[1..-1]
      .each_slice(2)
      .inject(operands[0]) do |last_value, (operator, operand)|
      eval [last_value, operator, operand].join
    end
  end
end
