FactoryBot.define do
  factory :admin do
    company { 'bolty' }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    phone_number { '09012345678' }
  end
end
