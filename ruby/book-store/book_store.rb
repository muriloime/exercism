class BookStore
  PRICE = 8
  HASH = { [1, 1, 1, 1, 1] => PRICE * (1 - 0.25),
           [1, 1, 1, 1, 0] => PRICE * (1 - 0.2),
           [1, 1, 1, 0, 0] => PRICE * (1 - 0.1),
           [1, 1, 0, 0, 0] => PRICE * (1 - 0.05),
           [1, 0, 0, 0, 0] => PRICE }.freeze

  @@memo = {}

  def initialize(basket)
    @basket = basket.select(&:positive?).sort.reverse
  end

  def price
    @@memo[@basket] ||= begin
      HASH.map do |arr, p|
        new_basket = arr.zip(@basket).map { |v, b| b.to_i - v }
        p * arr.sum + self.class.new(new_basket).price if new_basket.all? { |x| x >= 0 }
      end.compact.min || 0
    end
  end

  def self.calculate_price(basket)
    new(books_count(basket)).price
  end

  def self.books_count(basket)
    basket.group_by(&:itself)
          .transform_values(&:count)
          .values
  end
end
