class Api::V1::OptionsController < ApplicationController
  before_action :set_option, only: [:show, :update, :destroy]

  def index
    render json: Option.all
  end


  def show
    render json: @option
  end

  def create
    option = Option.new(option_params)

    if option.save!
      render json: option
    else
      render json: option.errors, status: 400
    end

  end

  def update
    if @option.update(option_params)
      head :no_content
    else
      render json: @option.errors, status: 400
    end
  end

  def destroy
    if @option.destroy
      head :no_content
    else
      render json: @option.errors, status: 400
    end
  end


  private

    def option_params
      params.require(:option).permit(:id, :name, :cost)
    end

    def set_option
      @option = Option.find(params[:id])
    end

end
