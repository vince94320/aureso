class ModelTypesController < ApplicationController
  before_action :force_json_format

  def index
    render json: {
      models: [
        {
          name: "serie_1",
          model_types: [
            {
              name: "bmw_116i",
              total_price: 180000
            },
            {
              name: "bmw_125i",
              total_price: 255000
            }
          ]
        }
      ]
    }
  end

  private
  def force_json_format
    request.format = :json
  end
end
