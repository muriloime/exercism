class CustomSet
  def initialize(elements)
    @elements = elements.uniq.sort
  end

  def member?(element)
    elements.include?(element)
  end

  def add(element)
    tap do
      @elements = (elements + [element]).uniq.sort
    end
  end

  def empty?
    elements.empty?
  end

  def subset?(other)
    elements.all? { |element| other.member? element }
  end

  def disjoint?(other)
    elements.none? { |element| other.member? element }
  end

  def intersection(other)
    self.class.new(elements.select { |element| other.member? element })
  end

  def difference(other)
    self.class.new(elements.reject { |element| other.member? element })
  end

  def union(other)
    self.class.new(elements + other.elements)
  end

  def ==(other)
    elements.sort == other.elements.sort
  end

  protected

  attr_reader :elements
end
