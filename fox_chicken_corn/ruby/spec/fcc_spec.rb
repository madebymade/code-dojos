require_relative '../lib/fcc'

describe FCC do
  context '#check' do
    it 'should return false when given an invalid combination' do
      expect(subject.check([:chicken, :fox])).to be_falsy
      expect(subject.check([:corn, :chicken])).to be_falsy
    end

    it 'should return true if a valid combination is provided' do
      expect(subject.check([:chicken, :man])).to be_truthy
    end
  end
end
