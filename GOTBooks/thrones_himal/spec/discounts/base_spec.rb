describe Discounts::Base do
  describe '.initialize' do
    it 'cannot be instantiated' do
      expect { Discounts::Base.new }.to raise_error
    end
  end

  describe '#apply' do
    it 'cannot be called' do
      expect { Discounts::Base.new.apply }.to raise_error
    end
  end
end
