class BinarySearch
  attr_reader :list
  def initialize(list)
    raise ArgumentError if list.sort != list

    @list = list
  end

  def middle
    list.count / 2
  end

  def search_for(key)
    return middle if list[middle] == key
    raise RuntimeError if list.count == 1

    if list[middle] > key
      search_left(key)
    else
      middle + search_right(key)
    end
  end

  private

  def search_left(key)
    BinarySearch.new(left_list).search_for(key)
  end

  def search_right(key)
    BinarySearch.new(right_list).search_for(key)
  end

  def left_list
    list[0..middle - 1]
  end

  def right_list
    list[(middle)..-1]
  end
end
