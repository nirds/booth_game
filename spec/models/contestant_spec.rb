require 'rails_helper'

RSpec.describe Contestant, :type => :model do
  it 'requires a name' do
    hash = {  name: '',
              email: Faker::Internet.email,
              twitter_handle: Faker::Hacker.noun }
    contestant = Contestant.new(hash)
    expect(contestant).to_not be_valid
  end

  it 'requires a email' do
    hash = {  name: Faker::Name.name,
              email: '',
              twitter_handle: Faker::Hacker.noun }
    contestant = Contestant.new(hash)
    expect(contestant).to_not be_valid
  end

  it 'requires a unique email' do
    contestant = create :contestant
    hash = {  name: Faker::Name.name,
              email: contestant.email,
              twitter_handle: Faker::Hacker.noun }
    new_contestant = Contestant.new(hash)
    expect(new_contestant).to_not be_valid
  end

  it 'requires a twitter twitter_handle' do
    hash = {  name: Faker::Name.name,
              email: Faker::Internet.email,
              twitter_handle: '' }
    contestant = Contestant.new(hash)
    expect(contestant).to_not be_valid
  end

  it 'requires a unique twitter_handle' do
    contestant = create :contestant
    hash = {  name: Faker::Name.name,
              email: Faker::Internet.email,
              twitter_handle: contestant.twitter_handle }
    new_contestant = Contestant.new(hash)
    expect(new_contestant).to_not be_valid
  end
end