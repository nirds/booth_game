class GameController < ApplicationController

  def create
    @game = Game.new(game_params)
    if @game.save
      flash[:success] = "Tweet about us to be entered into the raffle. Good Luck!"
      redirect_to game_path(@game.id)
    else
      flash[:notice] = "We couldn't create a game, try again!"
      flash[:errors] = @game.errors.full_messages
      redirect_to root_path
    end
  end

  def index
    @game_contestants = GameContestant.all
  end

  private

  def game_contestant_params
    params.require(:game).permit(:hash_tag, :twitter_handle)
  end
end