require 'rails_helper'

describe Organization do
  it 'is invalid without a valid kind' do
    bmw  = build(:organization, kind: OrganizationKind.random)
    ford = build(:organization, kind: 'invalid kind')

    expect(bmw).to be_valid
    expect(ford).not_to be_valid
  end

  it 'is invalid without a valid pricing policy' do
    bmw  = build(:organization, pricing_policy: 'invalid policy')
    ford = build(:organization, pricing_policy: PricingPolicy.sample_name)

    expect(bmw).not_to be_valid
    expect(ford).to be_valid
  end

  it 'is invalid without a name' do
    expect(build(:organization, name: 'Ford')).to be_valid
    expect(build(:organization, name: '')).to be_invalid
  end

  it 'is invalid without a public name' do
    expect(build(:organization, public_name: 'Ford')).to be_valid
    expect(build(:organization, public_name: '')).to be_invalid
  end

  it 'can have many models' do
    bmw     = create(:organization)
    serie_1 = create(:serie_1)
    serie_3 = create(:serie_3)
    bmw.models << serie_1
    bmw.models << serie_3
    bmw.save

    expect(bmw.models).to match_array [serie_1, serie_3]
  end
end
