class ModelTypesController < ApplicationController
  def update
    if model_type
      render json: model_type, root: 'model_type'
    else
      render json: { errors: 'model not found' }, status: :unprocessable_entity
    end
  end

  private
  def model_type
    @model_type ||= ModelType.find_by_slug(params[:model_type_slug])
  end
end
