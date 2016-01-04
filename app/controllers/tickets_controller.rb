class TicketsController < ApplicationController
  def drawing
    ticket = Ticket.all.sample
    @winner = Contestant.find_by(id: ticket.contestant.id)
    ticket.destroy

    render "contestants/winner"
  end
end