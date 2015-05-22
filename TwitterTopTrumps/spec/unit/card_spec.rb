describe Card do
  let(:args) do
    { screen_name: 'madebymade',
      followers_count: 4000,
      friends_count: 500 }
  end

  let(:card) { Card.new(args) }

  context 'when calculating a cards rating' do
    subject { card.rating }
    it { is_expected.to eq(8) }
  end
end
