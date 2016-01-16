require 'rails_helper'

describe ModelTypesController do
  it '#index' do
    get :index, model_slug: 'serie-1'
    expect(response).to be_success
    expect(response).to render_template :index
  end
end