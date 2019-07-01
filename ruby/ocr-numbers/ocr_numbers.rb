class OcrNumbers
  attr_reader :lines

  ROW_SIZE = 4
  COL_SIZE = 3
  OCRS = [' _     _  _     _  _  _  _  _ ',
          '| |  | _| _||_||_ |_   ||_||_|',
          '|_|  ||_  _|  | _||_|  ||_| _|',
          '                              '].join("\n")

  def initialize(input)
    @lines = input.split("\n")

    raise IncorrectOcrInput if lines.count % ROW_SIZE != 0 ||
                               lines.first.size % COL_SIZE != 0
  end

  def ocr_list
    split(OCRS.split("\n"))
  end

  def convert
    lines.each_slice(ROW_SIZE).map do |group|
      decode_group(group)
    end.join(',')
  end

  def decode_group(group)
    split(group).map do |number|
      ocr_list.index(number) || '?'
    end.join
  end

  def self.convert(input)
    new(input).convert
  end

  def split(lines)
    lines.map { |line| line.scan(/.{1,3}/) }
         .transpose
         .map { |ocr| ocr.join("\n") }
  end
end

class IncorrectOcrInput < ArgumentError
end
