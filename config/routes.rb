Rails.application.routes.draw do
  resources :games
  resources :vessels
  resources :players

  # GAMES

  post '/game/:game_id/place/:player_id/:vessel_type/:y/:x' => 'games#place_vessels'

  post '/games/new/:game_name/:player1/:player2' => 'games#create'

  get '/game/:game_id/score' => 'games#score'

  post '/game/:game_id/shoot/:enemy_player_id/:y/:x' => 'games#shoot'

  post '/game/:game_id/reset' => 'games#reset'


  # VESSELS

  post '/vessel/create/:vessel_type/:vessel_name/:y/:x/player/:player_id' => 'vessels#create'

end
