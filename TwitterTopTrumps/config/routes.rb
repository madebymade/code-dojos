Rails.application.routes.draw do
  root to: 'game#index'

  post :play, to: 'game#play', as: :play_game

  get :results, to: 'game#results', as: :game_results
end
