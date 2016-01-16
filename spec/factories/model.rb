FactoryGirl.define do
  factory :model do
    name 'name_' + Random.new_seed.to_s

    factory :invalid_model do
      name nil
    end
  end
end
