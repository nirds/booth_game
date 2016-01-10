class ContactController < ApplicationController
  def new
    @contact = contact.new
  end

  def create
    @contact = contact.new(contact_params)
    if @contact.save
      flash[:success] = "Tweet about us to be entered into the raffle. Good Luck!"
      redirect_to new_contact_path
    else
      flash[:notice] = "We couldn't register you, try again!"
      flash[:errors] = @contact.errors.full_messages
      redirect_to new_contact_path
    end
  end

  def index
    @contacts = contact.all
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :twitter_handle)
  end
end