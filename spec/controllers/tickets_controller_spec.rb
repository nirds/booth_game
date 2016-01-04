require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  describe 'Drawing' do
    before do
      @contestant = create :contestant
      @ticket = Ticket.create(contestant_id: @contestant.id )
    end

    it 'selets a winner' do
      post :drawing
      expect(assigns(:winner)).to eq(@contestant)
    end

    it 'destroys a ticket after it is selected' do
      expect{ post :drawing }.to change{ Ticket.count }.by(-1)
    end

    it 'renders the winner page' do
      post :drawing
      expect(response).to render_template("contestants/winner")
    end
  end
end