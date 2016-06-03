FactoryGirl.define do
  factory :sponsor do
    name { Faker::Company.name }
    link { Faker::Internet.url }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'files', 'company_logo_1.png')) }
  end
end
