require_relative './golf_paths'

describe GolfPaths do
  subject { described_class.new(total_holes: total_holes).calc }

  context 'when 1 hole' do
    let(:total_holes) { 1 }
    it { is_expected.to eq(3) }
  end

  context 'when 2 holes' do
    let(:total_holes) { 2 }
    it { is_expected.to eq(9) }
  end

  context 'when 3 holes' do
    let(:total_holes) { 3 }
    it { is_expected.to eq(23) }
  end

  context 'when 4 holes' do
    let(:total_holes) { 4 }
    it { is_expected.to eq(23) }
  end

  context 'when 18 holes' do
    let(:total_holes) { 18 }
    it { is_expected.to eq(169_688_089) }
  end
end
