class RegistrationsController < Devise::RegistrationsController
  def new
    flash[:info] = 'Administrator registrations are disabled'
    redirect_to root_path
  end

  def create
    flash[:info] = 'Administrator registrations are disabled'
    redirect_to root_path
  end
end