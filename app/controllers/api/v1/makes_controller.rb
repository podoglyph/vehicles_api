class Api::V1::MakesController < ApplicationController


  def index
    render json: Make.all
  end


end
