FactoryGirl.define do
  factory :game do
    hash_tag Faker::Hacker.noun
    twitter_handle Faker::Hacker.noun
  end
end