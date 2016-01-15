FactoryGirl.define do
  factory :contact do
    name Faker::Name.name
    email Faker::Internet.email
    twitter_handle Faker::Hacker.noun
    phone '123456789'
  end
end