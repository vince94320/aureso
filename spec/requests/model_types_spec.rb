require 'rails_helper'

describe 'API Model Types' do
  it 'list of types for a specific model' do
    model = Model.create(name: 'Serie 1')

    get "/models/#{model.model_slug}/model_types"
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