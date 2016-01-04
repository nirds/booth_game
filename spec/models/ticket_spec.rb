require 'rails_helper'

RSpec.describe Ticket, :type => :model do
    it 'requires a contestant id' do
    hash = {  contestant_id: nil }
    ticket = Ticket.new(hash)
    expect(ticket).to_not be_valid
  end
end