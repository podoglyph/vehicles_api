class Api::V1::Vehicles::OptionController < ApplicationController

  def index
    render json: Vehicle.option(params[:option])
  end

end
