class GamesController < ApplicationController

  before_action :authenticate_admin!, except: [:show]

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    sanitize_fields
    if @game.save
      redirect_to game_path(@game.id)
    else
      flash[:errors] = @game.errors.full_messages
      redirect_to root_path
    end
  end

  def index
    @games = Game.all
  end

  def show
    @game = get_game
    @most_retweeted = []
    @contacts = []
    @prize = @game.prizes.sample
    if GameContestant.find_by(game: @game)
      @most_retweeted = @game.get_most_retweeted
      @contacts = Contact.where(id: get_active_game_contestant_ids )
    end
  end

  def draw_winner
    @game = get_game
    @game.update_score if params[:update_score]
    valid_game_contestants = GameContestant.where(is_drawing_winner: false)
    tickets = Ticket.where(game_id: @game.id, game_contestant: valid_game_contestants)

    unless tickets.empty? || @game.prizes.active(@game).empty?
      @prize = @game.prizes.active(@game).sample
      @prize.update_attributes(won: true)
      @winner = @game.select_winner(tickets)
    end
  end

  def end_game
    @game = get_game
    @game.update_score
    if GameContestant.find_by(game: @game)
      winner_ids = GameContestant.where(game: @game, is_drawing_winner: true).map { |c| c.contact_id }
      @winners = Contact.where(id: winner_ids)
      @most_retweeted = @game.get_most_retweeted
    end
    @game.update_attributes(ended_at: Date.today)
  end

  def update_scores
    get_game.update_score
    redirect_to game_path(Game.last)
  end

  private

  def sanitize_fields
    @game.twitter_handle.delete!('@')
    @game.hash_tag.delete!('#')
  end

  def game_params
    params.require(:game).permit(:hash_tag, :twitter_handle)
  end

  def get_game
    Game.find_by(id: params[:id])
  end

  def get_active_game_contestant_ids
    game_contestants = GameContestant.where(game_id: @game.id)
    active_contestants = GameContestant.joins(:tickets).where(tickets: {game_contestant: game_contestants})
    active_contestants.map{ |c| c.contact_id }
  end
end
