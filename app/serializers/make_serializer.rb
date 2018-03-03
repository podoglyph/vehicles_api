class MakeSerializer < ActiveModel::Serializer
  attributes :id, :name, :country, :created_at
end
