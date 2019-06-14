module ListOps
  def self.arrays(array)
    fold(array, 0) { |acc, _x| acc + 1 }
  end

  def self.reverser(array)
    fold(array, []) { |acc, x| acc.unshift(x) }
  end

  def self.concatter(array1, array2)
    fold(array2, array1) { |acc, x| acc << x }
  end

  def self.mapper(array, &block)
    fold(array, []) { |acc, x| acc << block.call(x) }
  end

  def self.filterer(array, &block)
    ret = []
    array.each { |x| ret << x if block.call(x) }
    ret
  end

  def self.sum_reducer(array)
    fold(array, 0) { |acc, x| acc += x }
  end

  def self.factorial_reducer(array)
    fold(array, 1) { |acc, x| acc *= x }
  end

  def self.fold(array, acc)
    array.each do |x|
      acc = yield acc, x
    end
    acc
  end
end
