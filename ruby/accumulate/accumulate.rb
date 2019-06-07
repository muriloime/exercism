module Accumulatable
  def accumulate
    each.with_object([]) { |elem, acc| acc << yield(elem) }
  end
end

class Array
  # def accumulate(*args, &block)
  #   map(*args, &block)
  # end
  include Accumulatable
end
