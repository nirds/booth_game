require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe 'Create' do
    context 'with valid params' do
      before do
        @good_hash = {  name: Faker::Name.name,
                        email: Faker::Internet.email,
                        twitter_handle: Faker::Hacker.noun,
                        phone: '123456789' }
      end

      it 'creates a contact' do
        expect { post :create, contact: @good_hash }.to change{Contact.count}.by(1)
      end

      context 'with no active game' do
        it 'flashes a message and redirects to new contact' do
          post :create, contact: @good_hash

          expect(response).to redirect_to(new_contact_path)
          expect(flash[:success]).to be_present
        end
      end

      context 'with an active game' do
        before { @game = FactoryGirl.create(:game) }
        it 'redirects to current game' do
          post :create, contact: @good_hash
          expect(response).to redirect_to(game_path(@game))
        end
      end
    end
  end
end