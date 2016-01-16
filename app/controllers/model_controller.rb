class ModelController < ApplicationController
  before_action :force_json_format

  def index
    render json: all_models, root: 'models'
  end

  private
  def force_json_format
    request.format = :json
  end

  def all_models
    Model.all
  end
end
