FactoryGirl.define do
  factory :model_type do
    name            'name_' + Random.new_seed.to_s
    model_type_code 'model_type_code_' + Random.new_seed.to_s
    model
    base_price      10000

    factory :invalid_model_type do
      name nil
    end

    factory :bmw_116i do
      model { create(:serie_1) }
      name '116i'
    end

    factory :bmw_330i do
      model { create(:serie_3) }
      name '330i'
    end
  end
end
