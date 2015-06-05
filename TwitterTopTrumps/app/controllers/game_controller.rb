class GameController < ApplicationController
  def index
  end

  def play
    player1 = Player.new(screen_name: params[:player1])
    player2 = Player.new(screen_name: params[:player2])

    flash[:results] = Game.new.play(player1, player2)

    redirect_to action: :results
  end

  def results
    @results = flash[:results]
  end
end
