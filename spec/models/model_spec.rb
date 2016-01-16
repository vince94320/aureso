require 'rails_helper'

describe Model do
  it 'infers the model slug based on the name' do
    sut = described_class.create(name: 'Some Name')

    expect(sut.model_slug).to eq 'some-name'
  end

  it 'has many model_types' do
    serie_1     = create(:model, name: 'Serie 1')
    bmw_125i    = create(:model_type, model: serie_1, name: 'BMW 125i')
    bmw_e21     = create(:model_type, model: serie_1, name: 'BMW 116i')
    model_types = serie_1.model_types

    expect(model_types).to match_array [bmw_125i, bmw_e21]
  end
end