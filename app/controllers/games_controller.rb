class GamesController < ApplicationController

  # POST /game/:game_id/place/:player_id/:vessel_type/:y/:x
  def place_vessel(y, x)
    @vessel = Vessel.find_by(player_id: params[:player_id], vessel_type: params[:vessel_type])
    @location = VesselLocation.create(x: params[:x], y: params[:y], vessel_id: @vessel.id)
  end

  # POST /game/:game_id/shoot/:enemy_player_id/:y/:x
  def shoot(y, x)
    @player = Player.find(params[:enemy_player_id])
    @vessels = @player.vessels
    @vessels.each do |vessel|
      vessel.vessel_locations.each do |location|
        if location.x == x && location.y == y
          @player.score += 1
          vessel.damage += 1
          if vessel.damage >= vessel.size
            vessel.status = 'SUNK'
            puts "Sunk"
          else
            puts "Hit" 
            # redirect_to turn <-- next_player's turn
          end
        else
          puts "Miss"
          # redirect_to turn <-- next_player's turn
        end
      end
    end
  end

  # GET /game/:game_id/score
  def score
    @game = Game.find(params[:game_id])
    @player1_score = Player.find(@game.players.first).score
    @player2_score = Player.find(@game.players.last).score
    render plain: "Player 1: #{@player1_score} | Player 2: #{@player2_score}"
  end

  def turn

  end

end
