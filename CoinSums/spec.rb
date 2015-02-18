require_relative './coin_sums'

describe CoinSum do
  subject { described_class.new(sum: sum).calc }
  context 'when we set a sum of 1p' do
    let(:sum) { 1 }
    it { is_expected.to eq 1 }
  end
end