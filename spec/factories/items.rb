FactoryBot.define do
  factory :item do
    name { 'アイテム' }
    text { 'アイテムです' }
    category_id { 1 }
    status_id { 1 }
    delivery_charge_id { 1 }
    prefecture_id { 1 }
    delivery_day_id { 1 }
    price { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test-image.png'), filename: 'test-image.png')
    end
  end
end
