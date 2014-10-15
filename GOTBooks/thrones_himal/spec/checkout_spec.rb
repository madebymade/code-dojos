describe Checkout do
  describe '#add' do
    let(:book) { Book.new('A Game of Thrones', 8) }
    subject { Checkout.new }

    it 'adds an item to the basket' do
      subject.add(book)
      expect(subject.basket.size).to eq(1)
      expect(subject.basket).to include(book)
    end
  end

  describe '#total' do
    let(:book_1) { Book.new('A Game of Thrones', 8) }
    let(:book_2) { Book.new('A Clash of Kings', 8) }
    let(:book_3) { Book.new('A Storm of Swords', 8) }
    let(:book_4) { Book.new('A Feast for Crows', 8) }
    let(:book_5) { Book.new('A Dance with Dragons', 8) }

    let(:quantity_rule) { Discounts::Quantity.new }
    let(:rules) { [quantity_rule] }

    subject do
      c = Checkout.new(rules)
      c.add(book_1)
      c.add(book_2)
      c.add(book_3)
      c.add(book_4)
      c.add(book_5)
      c.add(book_1)
      c.add(book_2)
      c.add(book_3)
      c
    end

    it 'calculates the total with discounts' do
      expect(subject.total).to eq(51.2)
    end
  end
end
