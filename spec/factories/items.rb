FactoryBot.define do
  factory :item do
    name { 'test' }
    description { 'testtesttesttesttes' }
    price               { 3000 }
    category_id         { 2 }
    prefecture_id       { 2 }
    shipping_charge_id  { 2 }
    shipping_day_id     { 2 }
    status_id           { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
