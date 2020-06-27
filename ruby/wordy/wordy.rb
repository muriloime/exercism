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

  def operands
    @question.scan(%r{[\d\+\-\*/]+})
  end

  def answer
    raise ArgumentError if /[a-zA-Z]/.match?(@question)

    initial_value, *tail_values = operands

    tail_values.each_slice(2)
               .inject(initial_value.to_i) do |accumulator, (operator, operand)|
      eval_binary_expression(accumulator, operator, operand.to_i)
    end
  end
end
