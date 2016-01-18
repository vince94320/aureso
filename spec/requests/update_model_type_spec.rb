require 'rails_helper'

describe 'Update model type' do
  it 'updates the base price and return the model type data', vcr: true do
    bmw      = create(:bmw, pricing_policy: 'Fixed')
    serie_1  = create(:model, organization: bmw, name: 'serie_1')
    bmw_330i = create(:bmw_330i, model: serie_1, base_price: 170000)
    post '/models/serie-3/model_types_price/bmw-330i', model_type: { base_price: 200000 }

    expect(json_response).to eq({
      'model_type' => {
        'name' => '330i',
        'base_price' => 200000,
        'total_price' => 200005
      }
    })
  end

  private
  def json_response
    JSON.parse(response.body)
  end
end
