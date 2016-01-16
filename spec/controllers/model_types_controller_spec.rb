require 'rails_helper'

describe ModelTypesController do
  it '#update' do
    post :update, model_slug: 'serie-1', model_type_slug: 'bmw-330i', base_price: 150000
    expect(response).to be_success
    expect(response.header['Content-Type']).to include 'application/json'
  end
end
