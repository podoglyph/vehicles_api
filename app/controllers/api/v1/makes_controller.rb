class Api::V1::MakesController < ApplicationController
  before_action :set_make, only: [:show, :update, :destroy]

  def index
    render json: Make.all
  end

  def show
    render json: @make
  end

  def create
    make = Make.new(make_params)

    if make.save!
      render json: make
    else
      render json: make.errors, status: 400
    end

  end


  def update
    if @make.update(make_params)
      head :no_content
    else
      render json: @make.errors, status: 400
    end
  end

  def destroy

    if @make.destroy
      head :no_content
    else
      render json: @make.errors, status: 400
    end

  end


  private

    def make_params
      params.require(:make).permit(:id, :name, :country)
    end

    def set_make
      @make = Make.find(params[:id])
    end

end
