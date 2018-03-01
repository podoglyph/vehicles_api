class Api::V1::MakesController < ApplicationController


  def index
    render json: Make.all
  end

  def show
    render json: Make.find(params[:id])
  end

  def create
    make = Make.new(make_params)

    if make.save!
      render json: make
    else
      render json: make.errors, status: 400
    end

  end

  private

    def make_params
      params.require(:make).permit(:name)
    end

end
