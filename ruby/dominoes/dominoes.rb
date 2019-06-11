require 'set'

class Dominoes
  attr_reader :dominoes

  def initialize(dominoes)
    @dominoes = dominoes
  end

  def chain?
    eulerian? && connected?
  end

  def self.chain?(dominoes)
    new(dominoes).chain?
  end

  def connected_components
    sets = domino_numbers.map { |x| [x, Set.new([x])] }.to_h
    dominoes.reject { |x, y| x == y }.map do |side1, side2|
      sets[side1] = sets[side1].union(sets[side2])
      sets[side1].map { |x| sets[x] = sets[side1] }
    end
    sets
  end

  def connected?
    connected_components.then do |cc|
      cc.empty? || cc.values.first.count == domino_numbers.count
    end
  end

  private

  def domino_numbers
    dominoes.flatten.uniq
  end

  def eulerian?
    dominoes
      .flatten
      .group_by(&:itself)
      .all? { |_, v| v.count.even? }
  end
end
