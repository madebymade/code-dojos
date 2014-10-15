class Checkout
  attr_reader :basket

  def initialize(rules = [])
    @basket = []
    @rules = rules
  end

  def add(book)
    @basket << book
  end

  def total
    total = calculate_total
    discount = calculate_total_discount

    (total - discount).round(2)
  end

  private

  def calculate_total
    @basket.reduce(0) { |t, book| t + book.price }
  end

  def calculate_total_discount
    @rules.reduce(0) { |t, rule| rule.apply(@basket) }
  end
end
