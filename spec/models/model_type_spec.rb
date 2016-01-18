require 'rails_helper'

describe ModelType do
  it 'should belongs to a model' do
    serie_1  = build(:model, name: 'Serie 1')
    bmw_116i = build(:model_type, model: serie_1, name: 'BMW 116i')
    bmw_e21  = build(:model_type, model: nil, name: 'BMW 116i')

    expect(bmw_116i.valid?).to eq true
    expect(bmw_116i.model).to eq serie_1
    expect(bmw_e21.valid?).to eq false
  end

  it 'infers it model_type_slug from its name and its organization name' do
    bmw_116i = create(:bmw_116i)
    bmw_116i.save

    expect(bmw_116i.model_type_slug).to eq 'bmw-116i'
  end

  it 'finds a model type by its slug' do
    bmw_116i = create(:bmw_116i)
    found_model_type = described_class.find_by_slug('bmw-116i')

    expect(found_model_type).to eq bmw_116i
  end

  it 'is invalid without a name' do
    expect(build(:model_type, name: 'Serie 5')).to be_valid
    expect(build(:model_type, model: create(:serie_1), name: '')).to be_invalid
  end

  it 'is invalid without a model type code' do
    expect(build(:model_type, model_type_code: '12345')).to be_valid
    expect(build(:model_type, model: create(:serie_1), model_type_code: '')).to be_invalid
  end

  it 'is invalid without a base price' do
    expect(build(:model_type, base_price: 120000)).to be_valid
    expect(build(:model_type, model: create(:serie_1), base_price: nil)).to be_invalid
  end
end
