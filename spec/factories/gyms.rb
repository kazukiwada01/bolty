FactoryBot.define do
  factory :gym do
    after(:build) do |gym|
      gym.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    name           { 'test' }
    prefecture_id  { 2 }
    city_name      { 'test' }
    street         { 'test' }
    gym_url        { 'https://test.com' }
    admin
  end
end
