require 'rails_helper'

describe 'Update model type' do
  it 'updates the base price and return the model type data' do
    serie_3  = create(:model, name: 'serie_3')
    bmw_330i = create(:model_type, model: serie_3, name: 'bmw_330i', model_type_code: 'qwerty', base_price: 170000)

    get "/models/serie-3/model_types_price/bmw-330i"

    json = JSON.parse(response.body)
    p json
    # expect(json).to eq({
    #   "models" => [
    #     {
    #       "name" => "serie_1",
    #       "model_types" => [
    #         {
    #           "name" => "bmw_116i",
    #           "total_price" => 180000
    #         },
    #         {
    #           "name" => "bmw_125i",
    #           "total_price" => 255000
    #         }
    #       ]
    #     }
    #   ]
    })
  end
end
