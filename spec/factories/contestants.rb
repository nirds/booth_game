FactoryGirl.define do
  factory :contestant do
    name Faker::Name.name
    email Faker::Internet.email
    twitter_handle Faker::Hacker.noun
  end
end