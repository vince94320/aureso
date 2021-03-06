require 'rails_helper'

describe 'List models' do
  it 'is a JSON list of models and their model types', :vcr do
    bmw      = create(:bmw, pricing_policy: 'Fixed')
    serie_1  = create(:model, organization: bmw, name: 'serie_1')
    bmw_116i = create(:model_type, model: serie_1, name: 'bmw_116i', model_type_code: 'qwerty', base_price: 170000)
    bmw_125i = create(:model_type, model: serie_1, name: 'bmw_125i', model_type_code: 'qwerty', base_price: 245000)

    get "/models/serie-1/model_types"
    json = JSON.parse(response.body)

    expect(json).to eq({
      "models" => [
        {
          "name" => "serie_1",
          "model_types" => [
            {
              "name" => "bmw_116i",
              "total_price" => 170005
            },
            {
              "name" => "bmw_125i",
              "total_price" => 245005
            }
          ]
        }
      ]
    })
  end
end
