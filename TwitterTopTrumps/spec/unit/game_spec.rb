describe Game do
  around(:each) { |example| VCR.use_cassette(:twitter_followers, &example) }

  context 'when two players play a game' do
    let(:player1) { Player.new(screen_name: 'SebAshton') }
    let(:player2) { Player.new(screen_name: 'LukeMorton') }

    subject { Game.new.play(player1, player2) }

    it { is_expected.to include(winner: player2) }
    it { is_expected.to include(player1: a_hash_including(player: player1)) }
    it { is_expected.to include(player2: a_hash_including(player: player2)) }
  end

end
