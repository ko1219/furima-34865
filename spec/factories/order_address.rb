FactoryBot.define do
  factory :order_address do
    token             {9393999999999}
    postcode          {"431-3111"}
    phone_number      {"08026586811"}
    prefecture_id     {2}
    city              {Faker::Address.city}
    block             {Faker::Address.building_number}
  end
end
