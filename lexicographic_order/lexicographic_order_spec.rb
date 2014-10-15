require_relative './lexicographic_order'

describe LexicographicOrder do
  let(:seed) { [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] }

  context '#at' do
    subject { described_class.new.at(seed, 1_000_000) }
    it { is_expected.to eq(2783915460) }
  end
end