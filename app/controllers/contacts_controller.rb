class ContactsController < ApplicationController

  before_action :authenticate_admin!, only: [:index]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    sanitize_fields
    if @contact.save
      game = Game.last
      if game && !game.ended_at
        contestant = GameContestant.create(contact: @contact, game: game)
        Ticket.create(game_contestant: contestant, game: game)

        flash[:success] = "You're in, now tweet ##{game.hash_tag} @#{game.twitter_handle} to win!"
        redirect_to game_path(Game.last)
      else
        flash[:success] = "We'll let you know when we have our next game!"
        redirect_to new_contact_path
      end
    else
      flash[:notice] = "We couldn't register you, try again!"
      flash[:errors] = @contact.errors.full_messages
      redirect_to new_contact_path
    end
  end

  def index
    @contacts = Contact.all
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :twitter_handle, :phone)
  end

  def sanitize_fields
    @contact.twitter_handle.delete!('@')
  end
end