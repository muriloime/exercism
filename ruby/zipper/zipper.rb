require 'forwardable'

class Zipper
  attr_reader :focus

  def initialize(root)
    @root = root
    @focus = root
    @focus_list = []
  end

  def self.from_tree(tree)
    new(tree)
  end

  def to_tree
    @root
  end

  def set_value(value, node = focus)
    node&.set_value(value)
    self
  end

  def set_left(value)
    set_value(value, focus.left)
  end

  def set_right(value)
    set_value(value, focus.right)
  end

  def left
    add_focus(focus.left)
  end

  def right
    add_focus(focus.right)
  end

  def up
    remove_focus
  end

  def value
    focus&.value
  end

  def add_focus(new_focus)
    return unless new_focus

    @focus_list.append(focus)
    @focus = new_focus
    self
  end

  def remove_focus
    return if @focus_list.empty?

    @focus = @focus_list.pop
    self
  end

  def ==(other)
    @focus == other.focus
  end
end

class Node
  attr_reader :value, :left, :right

  def initialize(value, left, right)
    @value = value
    @left = left
    @right = right
  end

  def set_value(node)
    if node.class == self
      @value = node.value
      @left = node.left
      @right = node.right
    else
      @value = node
      @left = nil
      @right = nil
    end
  end

  def ==(other)
    value = other&.value && left == other.left && right == other.right
  end
end
