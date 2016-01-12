class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
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

  def show
    @game = get_game
    contestant_ids = get_active_game_contestant_ids
    @contacts = Contact.where(id: contestant_ids )
  end

  private

  def game_params
    params.require(:game).permit(:hash_tag, :twitter_handle)
  end

  def get_game
    Game.first
    # Game.find_by(id: params[:id])
  end

  def get_active_game_contestant_ids
    game_contestants = GameContestant.where(game_id: @game.id)
    active_contestants = GameContestant.joins(:tickets).where(tickets: {game_contestant: game_contestants})
    active_contestants.map{ |c| c.contact_id }
  end
end