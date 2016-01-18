class PrizesController < ApplicationController
  before_action :authenticate_admin!
  before_action :get_prize, only: [:edit, :update, :destroy]

  def new
    @game = Game.find_by(id: params[:game_id])
    @prize = Prize.new(game: @game)
  end

  def create
    @prize = Prize.new(prize_params)
    if @prize.save
      flash[:success] = "Prize added!"
      redirect_to :back
    else
      flash[:errors] = @prize.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @game = Game.find_by(id: @prize.game_id)
  end

  def update
    redirect_to prizes_path
  end

  def index
    @game = Game.find_by(id: params[:game_id])
    @game ||= Game.last
    @prizes = Prize.active(@game)
  end

  def destroy
    if @prize.destroy
      flash[:success] = "Prize deleted!"
      redirect_to prizes_path
    else
      flash[:errors] = @prize.errors.full_messages
      redirect_to edit_prize_path(@prize)
    end
  end

  private

  def prize_params
    params.require(:prize).permit(:description, :image_url, :game_id)
  end

  def get_prize
    @prize = Prize.find_by(id: params[:id])
  end
end