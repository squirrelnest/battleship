class VesselsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /vessels/new
  def new
    @vessel = Vessel.new()
  end

  # POST /vessel/create/:vessel_type/:vessel_name/:y/:x/player/:player_id
  def create
    @vessel = Vessel.create(player_id: params[:player_id], vessel_type: params[:vessel_type], name: params[:vessel_name], damage: 0)
    @location = VesselLocation.create(x: params[:x], y: params[:y], vessel_id: @vessel.id)
    if @location.save
      render plain: "Vessel #{@vessel.name} created for player #{params[:player_id]} at #{@location.y}, #{@location.x}!"
    else
      render plain: "Location taken or out of range. Try again."
    end
  end

end
