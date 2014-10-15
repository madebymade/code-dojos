module Thrones
  class Book
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def price
      8
    end

    def eql?(book)
      name == book.name
    end
  end
end
