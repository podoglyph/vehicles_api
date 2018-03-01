class Api::V1::MakesController < ApplicationController


  def index
    render json: Make.all
  end

  def show
    render json: Make.find(params[:id])
  end

end
