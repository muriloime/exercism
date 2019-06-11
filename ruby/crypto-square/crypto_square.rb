class Crypto
  def initialize(text)
    @text = text
  end

  def condensed_text
    @text.downcase.scan(/\w/).join
  end

  def square_size
    Math.sqrt(condensed_text.size).ceil
  end

  def squared_text
    condensed_text.ljust(square_size**2, ' ')
  end

  def transposed_text
    squared_text.chars.each_slice(square_size).to_a.transpose
  end

  def ciphertext
    return '' if @text == ''

    transposed_text.map(&:join).join(' ').gsub('  ', ' ')
  end
end
