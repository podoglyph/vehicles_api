class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :make, :model, :color, :mileage, :condition, :pre_owned, :total_price, :options

  def make
    model = Model.find(object.model_id)
    Make.find(model.make_id).name
  end

  def model
    Model.find(object.model_id).name
  end

  def total_price
    base_price + options_cost
  end

  def color
    Model.find(object.model_id).color
  end

  def base_price
    Model.find(object.model_id).base_price
  end

  def options
    object.options
  end

  def options_cost
    total = 0
    object.options.map do |o|
      total += o.cost
    end
    total
  end

end
