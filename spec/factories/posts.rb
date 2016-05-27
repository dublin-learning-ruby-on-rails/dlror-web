FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.words(6) }
    content { Faker::Lorem.paragraph }
  end
end
