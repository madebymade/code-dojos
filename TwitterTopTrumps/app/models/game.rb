class Game
  def round(card_1, card_2)
    if card_1.rating > card_2.rating
      card_1
    elsif card_2.rating > card_1.rating
      card_2
    else
      nil
    end
  end

  def battle(player_1, player_2)
    nil
  end
end
