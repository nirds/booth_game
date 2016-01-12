class GameContestantController < ApplicationController

  def create
    @game_contestant = GameContestant.new(game_contestant_params)
    if @game_contestant.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def index
    @game_contestants = GameContestant.all
  end

  private

  def game_contestant_params
    params.require(:game_contestant).permit(:contact_id, :game_id)
  end
end