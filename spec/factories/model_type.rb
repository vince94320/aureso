FactoryGirl.define do
  factory :model_type do
    name            'name_' + Random.new_seed.to_s
    model_type_code 'model_type_code_' + Random.new_seed.to_s
    base_price      10000

    factory :invalid_model_type do
      name nil
    end
  end
end
