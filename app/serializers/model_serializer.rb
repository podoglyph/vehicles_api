class ModelSerializer < ActiveModel::Serializer
  attributes :id, :name, :year, :color, :base_price, :make_id, :make

  def make
    Make.find(object.make_id).name
  end
  
end
