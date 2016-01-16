FactoryGirl.define do
  factory :organization do
    name           'name_' + Random.new_seed.to_s
    public_name    'public_name_' + Random.new_seed.to_s
    pricing_policy PricingPolicies.random
    type           OrganizationTypes.random

    factory :invalid_organization do
      name nil
    end
  end
end