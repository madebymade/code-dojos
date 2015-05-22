describe TwitterFollowers do
  context 'when grabbing users first 100 followers' do
    let(:user) { 'LukeMorton' }
    subject { TwitterFollowers.new.deck_for(user) }

    around(:each) { |example| VCR.use_cassette(:twitter_followers, &example) }

    its(:count) { is_expected.to eq(100) }

    it 'should build a deck of cards' do
      expect(subject.first.class).to eq(Card)
    end
  end
end
