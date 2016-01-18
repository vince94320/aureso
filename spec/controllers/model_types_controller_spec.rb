require 'rails_helper'

describe ModelTypesController do
  describe 'update' do
    it 'updates model type and returns it' do
      bmw_116i   = create(:bmw_116i)
      allow(ModelTypeSerializer).to receive(:serialize).and_return(double)

      post :update, model_slug: bmw_116i.model_slug, model_type_slug: bmw_116i.model_type_slug, model_type: { base_price: 150000 }

      expect(response).to be_success
      expect(response.header['Content-Type']).to include 'application/json'
    end

    it 'returns errors when model type not found' do
      allow(ModelTypeSerializer).to receive(:serialize).and_return(nil)

      post :update, model_slug: 'serie-1', model_type_slug: 'bmw-330i', model_type: { base_price: 150000 }

      expect(response).to have_http_status(422)
    end
  end
end
