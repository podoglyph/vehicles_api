class Api::V1::Vehicles::MostExpensiveController < ApplicationController

  def index
    render json: Vehicle.most_expensive
  end

end
