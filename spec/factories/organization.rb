FactoryGirl.define do
  factory :organization do
    name           'name_' + Random.new_seed.to_s
    public_name    'public_name_' + Random.new_seed.to_s
    pricing_policy PricingPolicy.random
    kind           OrganizationKind.random

    factory :invalid_organization do
      name nil
    end

    factory :bmw do
      name 'BMW'
    end
  end
end
