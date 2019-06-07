module Bob
  def self.hey(remark)
    BobAnswer.new(remark).reply
  end
end

class BobAnswer
  attr_reader :remark
  def initialize(remark)
    @remark = remark
  end

  def question?
    remark.strip[-1] == '?'
  end

  def scream?
    remark.upcase == remark
  end

  def has_content?
    remark.count('a-zA-Z') != 0
  end

  def reply
    if scream? && has_content?
      if question?
        "Calm down, I know what I'm doing!"
      else
        'Whoa, chill out!'
      end
    elsif question?
      'Sure.'
    elsif remark.strip.empty?
      'Fine. Be that way!'
    else
      'Whatever.'
    end
  end
end
