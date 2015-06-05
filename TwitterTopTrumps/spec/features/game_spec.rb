feature 'Game' do
  scenario 'Playing a game' do
    when_seb_plays_luke
    then_luke_should_win
  end

  def when_seb_plays_luke
    visit root_path
    fill_in :player1, with: 'SebAshton'
    fill_in :player2, with: 'LukeMorton'

    VCR.use_cassette(:in_page_play) do
      click_button 'Play'
    end
  end

  def then_luke_should_win
    expect(page).to have_content('@LukeMorton wins!')
  end
end


