# battleship
The naval combat game in RoR with Ruby version 2.4.0

## To Play

1) Clone git repo
2) Run bundle install
3) Download a headless testing tool like Postman: https://www.getpostman.com/postman
4) Start rails server: rails s (by default, listens to port 3000)
5) Start rails console: rails c
6) Use Postman to make a request to the routes below, replacing parameters with your desired values:

  ### ROUTES

    Place vessels:
  post 'localhost:3000/game/:game_id/place/:player_id/:vessel_type/:y/:x' => 'games#place_vessels'

    Create new game:
  post 'localhost:3000/games/new/:game_name/:player1_name/:player2_name' => 'games#create'

    Show score:
  get 'localhost:3000/game/:game_id/score' => 'games#score'

    Take a shot:
  post 'localhost:3000/game/:game_id/shoot/:enemy_player_id/:y/:x' => 'games#shoot'

    Reset game:
  post 'localhost:3000/game/:game_id/reset' => 'games#reset'

    Create vessel:
  post 'localhost:3000/vessel/create/:vessel_type/:vessel_name/:y/:x/player/:player_id' => 'vessels#create'

## TODOs

-   add turn-by-turn GUI instead of forcing players to know how to construct the above URLs
-   record coordinates of each shot fired by each player
-   provide more error handling and feedback to users - can't shoot in the same spot twice!
-   validate uniqueness of vessel locations (the combination of x and y need to be unique, but not individually)
-   constrain vessel shape (make sure all coordinates that belong to a vessel lie along a straight line and do not exceed vessel size)


