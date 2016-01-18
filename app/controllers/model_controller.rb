class ModelController < ApplicationController
  def index
    render json: ModelSerializer.serialize(Model.all, root: 'models')
  end
end
