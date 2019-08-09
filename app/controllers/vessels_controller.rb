class VesselsController < ApplicationController

  # GET /vessels/new
  def new
    @vessel = Vessel.new()
  end

  # POST /vessels/new/:vessel_type/player/:player_id
  def create
    @vessel = Vessel.new(name: params[:vessel_name], vessel_type: params[:vessel_type], player_id: params[:player_id])
    if @vessel.save
      redirect_to @vessel, { notice: 'Vessel was successfully created.' }
    else
      render :new
    end
  end
end
