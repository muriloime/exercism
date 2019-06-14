class CircularBuffer
  BufferEmptyException = Class.new(ArgumentError)
  BufferFullException = Class.new(ArgumentError)

  def initialize(size)
    @size = size
    clear
  end

  def read
    raise BufferEmptyException unless @data[0]

    @data.shift
  end

  def write(value)
    raise BufferFullException if full?

    @data << value
  end

  def write!(value)
    read if full?

    write(value)
  end

  def clear
    @data = []
  end

  private

  def full?
    @data.count == @size
  end
end
