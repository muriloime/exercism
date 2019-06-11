class Crypto
  attr_accessor :message

  def initialize(text)
    @message = text.downcase.scan(/\w/).join
  end

  def ciphertext
    return '' if message == ''

    transposed_text.map(&:join).join(' ').gsub('  ', ' ')
  end

  private

  def square_size
    Math.sqrt(message.size).ceil
  end

  def squared_text
    message.ljust(square_size**2, ' ')
  end

  def transposed_text
    squared_text.chars.each_slice(square_size).to_a.transpose
  end
end
