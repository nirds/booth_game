require 'rails_helper'

RSpec.describe ContestantsController, type: :controller do
  describe 'Create' do
    context 'with valid params' do
      before do
        @good_hash = {  name: Faker::Name.name,
                        email: Faker::Internet.email,
                        twitter_handle: Faker::Hacker.noun }
      end

      it 'creates a contestant' do
        expect{ post :create, contestant: @good_hash }.to change{Contestant.count}.by(1)
      end

      it 'creates a contestant with a ticket' do
        expect{ post :create, contestant: @good_hash }.to change{Ticket.count}.by(1)
      end

      it 'responds with a success flash' do
        post :create, contestant: @good_hash
        expect(flash[:success]).to eq("Good Luck!")
      end
    end

    context 'with invalid params' do
      before do
        @bad_hash = { name: nil,
                      email: Faker::Internet.email,
                      twitter_handle: nil }
      end

      it 'does not create a contestant' do
        expect{ post :create, contestant: @bad_hash }.to change{Contestant.count}.by(0)
      end

      it 'does not create a ticket' do
        expect{ post :create, contestant: @bad_hash }.to change{Ticket.count}.by(0)
      end

      it 'responds with an notice flash' do
        post :create, contestant: @bad_hash
        expect(flash[:notice]).to eq("We couldn't register you, try again!")
      end
    end
  end
end