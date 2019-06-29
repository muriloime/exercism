class Grep
  def initialize(pattern, flags)
    @flags = flags
    @pattern = pattern
  end

  def xflag_pattern
    if @flags.include?('-x')
      "^#{@pattern}$"
    else
      @pattern
    end
  end

  def pattern
    if @flags.include?('-i')
      /#{xflag_pattern}/i
    else
      /#{xflag_pattern}/
    end
  end

  def match?(line)
    if @flags.include?('-v')
      line !~ pattern
    else
      line =~ pattern
    end
  end

  def nflag_output(line, i)
    if @flags.include?('-n')
      "#{i + 1}:#{line}"
    else
      line
    end
  end

  def output(line, i, filename)
    if filename
      "#{filename}:#{nflag_output(line, i)}"
    else
      nflag_output(line, i)
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
