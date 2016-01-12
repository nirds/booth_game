require 'rails_helper'

RSpec.describe Game, :type => :model do
  let(:twitter_handle) { Faker::Hacker.noun }
  let(:hash_tag) { Faker::Hacker.noun }


  it 'requires a contestant id' do
    hash = {  twitter_handle: twitter_handle, hash_tag: nil }
    game = Game.new(hash)
    expect(game).to_not be_valid
  end

  it 'requires a game id' do
    hash = {  twitter_handle: nil, hash_tag: hash_tag }
    game = Game.new(hash)
    expect(game).to_not be_valid
  end
end