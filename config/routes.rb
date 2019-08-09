Rails.application.routes.draw do
  resources :games
  resources :vessels
  resources :players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/games/:game_id/:player1/:player2' => 'games#create'

  post '/vessels/new/:vessel_name/:vessel_size/player/:player_id' => 'vessels#create'
end
