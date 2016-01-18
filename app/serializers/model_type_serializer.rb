class ModelTypeSerializer
  include Serializer

  def build(model_type)
    {
      model_type: {
        name: model_type.name,
        base_price: model_type.base_price.to_s,
        total_price: model_type.total_price.to_s
      }
    }
  end
end
