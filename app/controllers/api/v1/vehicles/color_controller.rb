class Api::V1::Vehicles::ColorController < ApplicationController

  def index
    render json: Vehicle.color(params[:color])
  end

end
