require 'rails_helper'

describe ModelController do
  it 'list models' do
    get :index, model_slug: 'serie-1'
    expect(response).to be_success
    expect(response.header['Content-Type']).to include 'application/json'
  end
end
