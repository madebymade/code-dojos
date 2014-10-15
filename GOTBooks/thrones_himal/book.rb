class Book
  attr_accessor :name, :price

  def initialize(name, price)
    @name, @price = name, price
  end

  def ==(book)
    self.name == book.name
  end
end
