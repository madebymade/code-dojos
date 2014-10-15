describe Book do
  describe '.initialize' do
    subject { Book.new('A Game of Thrones', 8) }

    it 'sets the book name' do
      expect(subject.name).to eq('A Game of Thrones')
    end

    it 'sets the book price' do
      expect(subject.price).to eq(8)
    end
  end

  describe '#==' do
    let(:book_1) { Book.new('A Game of Thrones', 8) }
    let(:book_2) { Book.new('A Game of Thrones', 8) }
    let(:book_3) { Book.new('A Clash of Kings', 8) }

    it 'is true if both books have the same name' do
      expect(book_1 == book_2).to eq(true)
    end

    it 'is not equal if the names are different' do
      expect(book_1 == book_3).to eq(false)
    end
  end
end
