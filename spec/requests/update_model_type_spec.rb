require 'rails_helper'

describe 'Update model type' do
  it 'updates the base price and return the model type data' do
    bmw_330i = create(:bmw_330i, base_price: 170000)
    post '/models/serie-3/model_types_price/bmw-330i'

    expect(json_response).to eq({
      'model_type' => {
        'name' => '330i',
        'base_price' => 170000,
        'total_price' => 240000
      }
    })
  end

  private
  def json_response
    JSON.parse(response.body)
  end
end
