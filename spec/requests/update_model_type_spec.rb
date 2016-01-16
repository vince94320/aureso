require 'rails_helper'

describe 'Update model type' do
  it 'updates the base price and return the model type data' do
    serie_3  = create(:model, name: 'serie_3')
    bmw_330i = create(:model_type, model: serie_3, name: '330i', model_type_code: 'qwerty', base_price: 170000)

    post "/models/serie-3/model_types_price/bmw-330i"

    json = JSON.parse(response.body)

    expect(json).to eq({
      "model_type" => {
        "name" => "330i",
        "base_price" => 200000,
        "total_price" => 240000
      }
    })
  end
end
