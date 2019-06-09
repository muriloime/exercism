class Allergies
  ITEMS = %w[eggs
             peanuts
             shellfish
             strawberries
             tomatoes
             chocolate
             pollen
             cats].freeze

  def initialize(score)
    @score = score
  end

  def allergic_to?(item)
    list.include?(item)
  end

  def list
    ITEMS.select.with_index do |_, index|
      (@score & 2**index).positive?
    end
  end
end
