FactoryGirl.define do
  factory :model do
    name         'name_' + Random.new_seed.to_s
    organization

    factory :invalid_model do
      name nil
    end

    factory :serie_1 do
      organization { create(:bmw) }
      name         'Serie 1'
    end

    factory :serie_3 do
      organization { create(:bmw) }
      name         'Serie 3'
    end
  end
end
