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

  def eval_binary_expression(operand1, operator, operand2)
    operand1.send(operator, operand2)
  end

  def answer
    raise ArgumentError if /[a-zA-Z]/.match?(@question)

    operands = @question.scan(%r{[\d\+\-\*/]+})

    operands[1..-1]
      .each_slice(2)
      .inject(operands[0]) do |last_value, (operator, operand)|
      eval_binary_expression(last_value.to_i, operator, operand.to_i)
    end
  end
end
