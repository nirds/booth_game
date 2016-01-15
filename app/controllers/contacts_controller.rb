class ContactsController < ApplicationController

  before_action :authenticate_admin!, only: [:index]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      if Game.last && !Game.last.ended_at
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
    params.require(:contact).permit(:name, :email, :twitter_handle)
  end
end