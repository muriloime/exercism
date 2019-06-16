class Deque
  def initialize
    @head = nil
    @tail = nil
  end

  def push(i)
    elem = Element.new(i)
    @head ||= elem
    if @tail
      @tail.next = elem
      elem.prior = @tail
    end
    @tail = elem
  end

  def pop
    @tail.then do |tail|
      @head = nil if @head == tail
      @tail = tail&.prior
      tail&.prior&.next = nil
      tail.value
    end
  end

  def shift
    @head.then do |head|
      @tail = nil if @tail == head
      @head = head&.next
      head&.next&.prior = nil
      head.value
    end
  end

  def unshift(i)
    elem = Element.new(i)
    @tail ||= elem
    if @head
      @head.prior = elem
      elem.next = @head
    end
    @head = elem
  end
end

class Element
  attr_accessor :prior, :next
  attr_reader :value

  def initialize(value)
    @value = value
  end
end
