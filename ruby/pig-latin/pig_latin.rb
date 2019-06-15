class PigLatin
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def translate
    word.scan(pattern).reverse.join + 'ay'
  end

  def self.translate(phrase)
    words = phrase.split
    words.map { |word| PigLatin.new(word).translate }.join(' ')
  end

  # private

  VOWEL = /[aeiou]/.freeze
  NOT_VOWEL = /[^aeiou]/.freeze

  def diphthong?
    !!word[/u#{VOWEL}+/i]
  end

  def starts_with_vowel?
    !!word[/\b#{VOWEL}\w+/]
  end

  def rule4?
    !!word[/\b#{NOT_VOWEL}+y/i]
  end

  def pattern
    if starts_with_vowel?
      /\w+/
    elsif diphthong?
      /\w+u|\w+/
    elsif rule4?
      /\b[^aeiouy]+|\w+/i
    else
      /\A[xy]#{NOT_VOWEL}+\w+|\A#{NOT_VOWEL}+|\w+/i
    end
  end
end
