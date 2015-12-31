class ContestantsController < ApplicationController
  def new
    @contestant = Contestant.new
  end

  def create
    @contestant = Contestant.new(contestant_params)
    if @contestant.save
      flash[:success] = "Good Luck!"
      redirect_to new_contestant_path
    else
      flash[:notices] = "We couldn't enter you, try again!"
      redirect_to new_contestant_path
    end
  end

  def index
    @contestants = Contestant.all
  end

  private

  def contestant_params
    params.require(:contestant).permit(:name, :email, :twitter_handle)
  end
end