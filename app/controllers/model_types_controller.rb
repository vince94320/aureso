class ModelTypesController < ApplicationController
  def update
    if model_type_found? and model_type_updated?
      update_succeeded
    else
      update_failed
    end
  end

  private
  def model_type_params
    params.require(:model_type).permit(:base_price)
  end

  def update_failed
    render json: { errors: 'model not found' }, status: :unprocessable_entity
  end

  def update_succeeded
    render json: serialize(model_type), root: 'model_type'
  end

  def serialize(model_type)
    ModelTypeSerializer.serialize(model_type)
  end

  def model_type
    @model_type ||= ModelType.find_by_slug(params[:model_type_slug])
  end

  def model_type_found?
    model_type.present?
  end

  def model_type_updated?
    model_type.update(model_type_params)
  end
end
