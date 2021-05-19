FactoryBot.define do
  factory :user do
    nickname { 'taro' }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { '1a' + Faker::Internet.password(min_length: 6) }
    last_name { '山田' }
    first_name            { '太郎' }
    last_name_reading     { 'ヤマダ' }
    first_name_reading { 'タロウ' }
    birthday { '1930-01-31' }
  end
end
