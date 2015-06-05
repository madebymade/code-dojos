class Game
  def play(player_1, player_2)
    player1_deck = player_1.deck
    player2_deck = player_2.deck
    player1_score = 0
    player2_score = 0

    [player1_deck.count, player2_deck.count].min.times do
      card_1 = player1_deck.pop
      card_2 = player2_deck.pop

      case round(card_1, card_2)
      when card_1
        player1_score += 2
      when card_2
        player2_score += 2
      else
        player1_score += 1
        player2_score += 1
      end
    end

    add_winner_to_results(player1: { player: player_1,
                                     score: player1_score,
                                     deck: player1_deck },
                          player2: { player: player_2,
                                     score: player2_score,
                                     deck: player2_deck })
  end

  private

  def round(card_1, card_2)
    if card_1.rating > card_2.rating
      puts "#{card_1.screen_name} beats #{card_2.screen_name}! (#{card_1.rating} vs. #{card_2.rating})"
      card_1
    elsif card_2.rating > card_1.rating
      puts "#{card_2.screen_name} beats #{card_1.screen_name}! (#{card_1.rating} vs. #{card_2.rating})"
      card_2
    else
      nil
    end
  end

  def add_winner_to_results(results)
    if results[:player1][:score] > results[:player2][:score]
      results[:winner] = results[:player1][:player]
    elsif results[:player1][:score] < results[:player2][:score]
      results[:winner] = results[:player2][:player]
    else
      results[:winner] = nil
    end

    results
  end
end
