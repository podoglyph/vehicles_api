class Api::V1::Makes::ModelsController < ApplicationController

  def index
    render json: Model.where(make_id: params[:id])
  end

end
