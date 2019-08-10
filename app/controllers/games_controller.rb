class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  # POST localhost:3000/games/new/:game_name/:player1/:player2
  def create
    @game = Game.create(name: params[:game_name])
    Player.create(name: params[:player1], game_id: @game.id)
    Player.create(name: params[:player2], game_id: @game.id)
    render plain: "Game created."
  end

  # POST /game/:game_id/place/:player_id/:vessel_type/:y/:x
  def place_vessel
    @vessel = Vessel.find_by(player_id: params[:player_id], vessel_type: params[:vessel_type])
    @location = VesselLocation.create(x: params[:x], y: params[:y], vessel_id: @vessel.id)
  end

  # POST /game/:game_id/shoot/:enemy_player_id/:y/:x
  def shoot
    @player = Player.find(params[:enemy_player_id])
    @vessels = @player.vessels
    @vessels.each do |vessel|
      vessel.vessel_locations.each do |location|
        puts "x = #{location.x}"
        puts "y = #{location.y}"
        puts "#{params[:x].to_i == location.x}"
        puts "#{params[:y] == location.y}"
        if location.x == params[:x].to_i && location.y == params[:y]
          @player.update(score: @player.score += 1)
          vessel.update(damage: vessel.damage += 1)
          if vessel.damage >= vessel.size
            vessel.update(status: 'SUNK')
            puts "SUNK"
            score("SUNK", @player.name)
          else
            puts "HIT" 
            score("HIT", @player.name)
          end
        else
          puts "MISS"
          score("MISS", @player.name)
        end
      end
    end
  end

  # GET /game/:game_id/score
  def score(string="", enemy="")
    @game = Game.find(params[:game_id])
    @player1_score = Player.find(@game.players.first.id).score
    @player2_score = Player.find(@game.players.last.id).score
    if enemy != ""
      render plain: "Player 1: #{@player1_score} | Player 2: #{@player2_score} \n SHOT FIRED AT #{enemy} - #{string}!"
    else
      render plain: "Player 1: #{@player1_score} | Player 2: #{@player2_score}"
    end
  end

  # POST /game/:game_id/reset
  def reset
    @game = Game.find(params[:game_id])
    @game.players.each do |player|
      player.update(score: 0)
      player.vessels.each do |vessel|
        vessel.update(damage: 0, status: "ALIVE")
      end
    end
    puts "RESET SCORE"
    score()
  end

end
