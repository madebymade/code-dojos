require_relative './book'
require_relative './discount'

describe Thrones::Discount do
  let(:book_a) { Thrones::Book.new('A Game of Thrones') }
  let(:book_a_clone) { Thrones::Book.new('A Game of Thrones') }
  let(:book_b) { Thrones::Book.new('A Clash of Kings') }
  let(:book_c) { Thrones::Book.new('A Storm of Swords') }
  let(:book_c_clone) { Thrones::Book.new('A Storm of Swords') }

  context '#apply' do
    it 'should give a 5% discount when 2 different books are purchased' do
      expect(subject.apply([book_a, book_b])).to eq [5, 5]
    end

    it 'should give a 10% discount when 3 different books are purchased' do
      expect(subject.apply([book_a, book_b, book_c])).to eq [10, 10, 10]
    end

    it 'should not apply a discount to duplicate books' do
      expect(subject.apply([book_a, book_a_clone, book_c])).to eq [5, 0, 5]
    end

    it 'should apply 5% discount to two sets of two books' do
      expect(subject.apply([book_a, book_a_clone, book_c, book_c_clone])).to eq [5, 5, 5, 5]
    end
  end

  # context '#total_price' do
  #   it 'should return 15.20 when given two unique books' do
  #     expect(subject.total_price([book_a, book_b])).to eq(15.20)
  #   end
  # end
end

describe Thrones::Book do
  subject { described_class.new('A Game of Thrones') }

  context '#price' do

  end

  context '#==' do
    xit 'should return true if equal' do
      samebook = described_class.new('A Game of Thrones')
      expect(subject).to eq samebook
    end
  end
end
