require 'rails_helper'

describe ModelTypesController do
  it '#show' do
    get :index
    #expect(assigns[:user]).to be_nil
    expect(response).to be_success
    expect(response).to render_template :index
  end
end