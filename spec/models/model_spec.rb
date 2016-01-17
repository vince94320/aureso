require 'rails_helper'

describe Model do
  it 'infers the model slug based on the name of the organization and the model name' do
    bmw     = build(:organization, name: 'BMW')
    serie_1 = build(:model, organization: bmw, name: 'Serie 1')
    serie_1.save

    expect(serie_1.model_slug).to eq 'bmw-serie-1'
  end

  it 'has many model_types' do
    serie_1     = create(:model, name: 'Serie 1')
    bmw_125i    = create(:model_type, model: serie_1, name: 'BMW 125i')
    bmw_e21     = create(:model_type, model: serie_1, name: 'BMW 116i')
    model_types = serie_1.model_types

    expect(model_types).to match_array [bmw_125i, bmw_e21]
  end

  it 'is invalid without a company' do
    bmw     = create(:organization, name: 'BMW')
    serie_1 = create(:model, name: 'Serie 1', organization: bmw)
    serie_3 = build(:model, name: 'Serie 3', organization: nil)

    expect(serie_1).to be_valid
    expect(serie_1.organization).to eq bmw
    expect(serie_3).to_not be_valid
  end
end