require 'rails_helper'

describe 'API Model Types' do
  it 'list of types for a specific model' do
    serie_1  = create(:model, name: 'Serie 1')
    bmw_116i = create(:model_type, model: serie_1, name: 'bmw_116i', model_type_code: 'qwerty', base_price: 10000)
    bmw_125i = create(:model_type, model: serie_1, name: 'bmw_125i', model_type_code: 'qwerty', base_price: 15000)

    get "/models/#{serie_1.model_slug}/model_types"
    json = JSON.parse(response.body)

    expect(json).to eq({
      "models" => [
        {
          "name" => "serie_1",
          "model_types" => [
            {
              "name" => "bmw_116i",
              "total_price" => 180000
            },
            {
              "name" => "bmw_125i",
              "total_price" => 255000
            }
          ]
        }
      ]
    })
  end
end
