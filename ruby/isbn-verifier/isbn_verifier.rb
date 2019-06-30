module IsbnVerifier
  VALID_ISBN_FORMAT = /^\d{9}[\dX]$/.freeze

  def self.valid?(string)
    string = string.gsub(/[^\dX]/, '')

    return false unless string[VALID_ISBN_FORMAT]

    string.scan(/\w/)
          .map { |c| c == 'X' ? 10 : c.to_i }
          .map.with_index { |d, i| d * (10 - i) }
          .sum
          .modulo(11)
          .zero?
  end
end
