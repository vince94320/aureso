require 'rails_helper'

describe 'Model Types' do
  it 'list of types for a specific model' do
    get '/models/serie_1/model_types'
    json = JSON.parse(response.body)

    expect(json['models']).to eq([
      {
        "name": "serie_1",
        "model_types": [
          {
            "name": "bmw_116i",
            "total_priece": 180000
          },
          {
            "name": "bmw_125i",
            "total_priece": 255000
          }
        ]
      }
    ])
  end
end