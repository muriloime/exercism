class Bst
  attr_reader :data, :left, :right
  def initialize(data = nil)
    insert(data) if data
  end

  def insert(n)
    tap do
      if @data.nil?
        @data = n
      elsif n <= data
        (@left ||= Bst.new).insert(n)
      else
        (@right ||= Bst.new).insert(n)
      end
    end
  end

  def each
    return enum_for :each unless block_given?

    @left&.each &Proc.new
    yield @data
    @right&.each &Proc.new
  end
end
