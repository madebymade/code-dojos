describe Player do
  let(:args) do
    { screen_name: 'LukeMorton' }
  end

  let(:player) { Player.new(args) }

  context "when generating a player's deck" do
    around(:each) { |example| VCR.use_cassette(:twitter_followers, &example) }

    subject { player.deck }
    it { is_expected.to include(a_kind_of(Card)) }
  end
end
