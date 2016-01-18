class ModelSerializer
  include Serializer

  protected
  def build(model)
    {
      name: model.name,
      model_types: model.model_types.map do |model_type|
        {
          name: model_type.name,
          total_price: model_type.total_price.to_s
        }
      end
    }
  end
end
