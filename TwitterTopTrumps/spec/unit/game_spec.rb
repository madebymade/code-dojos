describe Game do
  context 'when pitting two Cards against each other' do
    let(:card1) { Card.new(screen_name: 'madebymade',
                           followers_count: 4000,
                           friends_count: 500) }

    let(:card2) { Card.new(screen_name: 'sebashton',
                           followers_count: 2000,
                           friends_count: 5) }

    subject { Game.new.round(card1, card2) }

    it { is_expected.to eq(card2) }
  end

  context 'when two players play a game' do
    let(:player1) { Player.new(screen_name: 'SebAshton') }
    let(:player2) { Player.new(screen_name: 'LukeMorton') }

    subject { Game.new.play(player1, player2) }

    it { is_expected.to eq(player2) }
  end

end
