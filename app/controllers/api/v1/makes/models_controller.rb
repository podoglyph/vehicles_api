class Api::V1::Makes::ModelsController < ApplicationController
  # before_action :set_model, only: [:show, :update, :destroy]

  def index
    render json: Model.where(make_id: params[:id])
  end

  def create
    make = Make.find(params[:id])
    model = make.models.new(model_params)

    if model.save!
      render json: model
    else
      render json: model.errors, status: 400
    end

  end

  private

  def model_params
    params.require(:model).permit(:id, :name)
  end

  # def set_model
  #   @model = Model.find(params[:id])
  # end

end
