class Api::V1::Vehicles::LeastMileageController < ApplicationController

  def index
    render json: Vehicle.least_mileage
  end

end
