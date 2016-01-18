class ModelTypesController < ApplicationController
  def update
    if model_type_serialized
      render json: model_type_serialized, root: 'model_type'
    else
      render json: { errors: 'model not found' }, status: :unprocessable_entity
    end
  end

  private
  def model_type_serialized
    model_type = ModelType.find_by_slug(params[:model_type_slug])
    ModelTypeSerializer.serialize(model_type)
  end
end
