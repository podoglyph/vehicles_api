class Api::V1::VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :update, :destroy]

  def index
    render json: Vehicle.all
  end

  def show
    render json: @vehicle
  end

  def create
    vehicle = Vehicle.new(vehicle_params)

    if vehicle.save!
      render json: vehicle
    else
      render json: vehicle.errors, status: 400
    end

  end

  def update
    if @vehicle.update(vehicle_params)
      head :no_content
    else
      render json: @vehicle.errors, status: 400
    end
  end

  def destroy
    if @vehicle.destroy
      head :no_content
    else
      render json: @vehicle.errors, status: 400
    end
  end

  private

    def vehicle_params
      params.require(:vehicle).permit(:nickname, :model_id)
    end

    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end
end
