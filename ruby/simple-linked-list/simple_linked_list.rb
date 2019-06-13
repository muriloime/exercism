class Element
  attr_reader :datum
  attr_accessor :next
  def initialize(datum)
    @datum = datum
  end
end

class SimpleLinkedList
  attr_reader :head

  def initialize(enum = [])
    @head = nil
    enum.each { |elem| push(Element.new(elem)) }
  end

  def push(element)
    tap do
      element.next = head
      @head = element
    end
  end

  def pop
    head.tap do |elem|
      @head = elem&.next
    end
  end

  def reverse!
    tap do
      ret = SimpleLinkedList.new
      while elem = pop
        ret.push(elem)
      end
      @head = ret.head
    end
  end

  def to_a
    elem = head
    res = []
    begin
      res << elem.datum if elem
    end while elem = elem&.next
    res
  end
end
