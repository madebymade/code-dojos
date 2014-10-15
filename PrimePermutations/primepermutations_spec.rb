require 'rspec'
require_relative './primepermutations'

describe PrimeNumber do
  context '#range' do
    it 'should return [2, 3, 5, 7] for 1, 10' do
      expect(described_class.range(1, 10)).to eq [2, 3, 5, 7]
    end
  end

  context '#permutation' do
    it 'should return [1487, 1478, 1847, 1874, 1748, 1784, 4187, 4178, 4817, 4871, 4718, 4781, 8147, 8174, 8417, 8471, 8714, 8741, 7148, 7184, 7418, 7481, 7814, 7841] for 1487' do
      expect(described_class.permutation(1487)).to eq [1487, 1478, 1847, 1874, 1748, 1784, 4187, 4178, 4817, 4871, 4718, 4781, 8147, 8174, 8417, 8471, 8714, 8741, 7148, 7184, 7418, 7481, 7814, 7841]
    end
  end

  context '#prime_permutations' do
    it 'should return [1487, 1847, 4817, 4871, 7481, 7841, 8147, 8741] for 1487' do
      expect(described_class.prime_permutation(1487)).to eq [1487, 1847, 4817, 4871, 7481, 7841, 8147, 8741]
    end
  end

   context '#prime_permutation_sequence_deltas' do
    it 'should return [3330, 3330] for [1487, 4817, 8147]' do
      expect(described_class.prime_permutation_sequence_deltas([1487, 4817, 8147])).to eq [1487, 4817, 8147]
    end
  end
end