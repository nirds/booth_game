require 'rails_helper'

RSpec.describe Ticket, :type => :model do
  let(:game) { FactoryGirl.create(:game) }
  let(:game_contestant) { FactoryGirl.create(:game_contestant) }

  it 'requires a contestant id' do
    hash = {  game: game, game_contestant: nil }
    ticket = Ticket.new(hash)
    expect(ticket).to_not be_valid
  end

  it 'requires a game id' do
    hash = {  game: nil, game_contestant: game_contestant }
    ticket = Ticket.new(hash)
    expect(ticket).to_not be_valid
  end

  it 'is dependent on game' do
    temp_game = FactoryGirl.create(:game)
    FactoryGirl.create(:ticket, game: temp_game, game_contestant: game_contestant)
    count = Ticket.all.count
    temp_game.destroy

    expect(Ticket.all.count).to eq(count - 1)
  end

  it 'is dependent on game contestant' do
    temp_game_contestant = FactoryGirl.create(:game_contestant)
    FactoryGirl.create(:ticket, game: game, game_contestant: temp_game_contestant)
    count = Ticket.all.count
    temp_game_contestant.destroy

    expect(Ticket.all.count).to eq(count - 1)
  end
end