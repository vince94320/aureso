class ModelController < ApplicationController
  def index
    render json: all_models, root: 'models'
  end

  private
  def all_models
    Model.all
  end
end
