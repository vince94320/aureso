require 'rails_helper'

describe Organization do
  it 'should have a valid type' do
    bmw  = build(:organization, type: OrganizationType.random)
    ford = build(:organization, type: 'invalid type')

    expect(bmw).to be_valid
    expect(ford).not_to be_valid
  end

  it 'should have a valid pricing policy' do
    bmw  = build(:organization, pricing_policy: 'invalid policy')
    ford = build(:organization, pricing_policy: PricingPolicy.random)

    expect(bmw).not_to be_valid
    expect(ford).to be_valid
  end
end
