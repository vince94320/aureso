class ModelTypeSerializer < ActiveModel::Serializer
  attributes :name, :total_price
end

class ModelSerializer < ActiveModel::Serializer
  attributes :name
  has_many :model_types
end