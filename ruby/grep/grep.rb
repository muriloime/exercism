class Grep
  def initialize(pattern, flags)
    @flags = flags
    @pattern = pattern
  end

  def pattern
    pattern = if @flags.include?('-x')
                "#{@pattern}$"
              else
                @pattern
              end

    if @flags.include?('-i')
      /#{pattern}/i
    else
      /#{pattern}/
    end
  end

  def match?(line)
    if @flags.include?('-v')
      line !~ pattern
    else
      line =~ pattern
    end
  end

  def output(line, i, filename)
    new_line = if @flags.include?('-n')
                 "#{i + 1}:#{line}"
               else
                 line
    end

    if filename
      "#{filename}:#{new_line}"
    else
      new_line
    end
  end

  def read(filename, write_filename)
    ret = []
    file = File.read(filename)

    if @flags.include?('-l')
      ret << filename if match?(file)
    else
      file.split("\n").each_with_index do |line, i|
        ret << output(line, i, write_filename && filename) if match?(line)
      end
    end

    ret
  end

  def self.grep(pattern, flags, files)
    ret = []
    grep = Grep.new(pattern, flags)

    files.each do |file|
      ret += grep.read(file, files.count > 1)
    end

    ret.join("\n")
  end
end
