require 'rails_helper'

describe ModelType do
  it 'should belongs to a model' do
    serie_1  = build(:model, name: 'Serie 1')
    bmw_116i = build(:model_type, model: serie_1, name: 'BMW 116i')
    bmw_e21  = build(:model_type, name: 'BMW 116i')

    expect(bmw_116i.valid?).to eq true
    expect(bmw_116i.model).to eq serie_1
    expect(bmw_e21.valid?).to eq false
  end

  it 'infers it model_type_slug from its name' do
    serie_1  = build(:model, name: 'Serie 1')
    bmw_116i = build(:model_type, model: serie_1, name: 'BMW 116i')

    bmw_116i.save

    expect(bmw_116i.model_type_slug).to eq 'bmw-116i'
  end
end