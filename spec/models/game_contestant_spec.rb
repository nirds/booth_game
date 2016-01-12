require 'rails_helper'

RSpec.describe GameContestant, :type => :model do
  let(:game) { FactoryGirl.create(:game) }
  let(:contact) { FactoryGirl.create(:contact) }

  it 'requires a contact id' do
    hash = {  game: game, contact: nil }
    game_contestant = GameContestant.new(hash)
    expect(game_contestant).to_not be_valid
  end

  it 'requires a game id' do
    hash = {  game: nil, contact: contact }
    game_contestant = GameContestant.new(hash)
    expect(game_contestant).to_not be_valid
  end

  it 'is dependent on game' do
    temp_game = FactoryGirl.create(:game)
    FactoryGirl.create(:game_contestant, game: temp_game, contact: contact)
    count = GameContestant.all.count
    temp_game.destroy

    expect(GameContestant.all.count).to eq(count - 1)
  end

  it 'is dependent on contact' do
    temp_contact = FactoryGirl.create(:contact)
    FactoryGirl.create(:game_contestant, game: game, contact: temp_contact)
    count = GameContestant.all.count
    temp_contact.destroy

    expect(GameContestant.all.count).to eq(count - 1)
  end
end