class PrizesController < ApplicationController
  before_action :authenticate_admin!
  before_action :get_prize, only: [:edit, :update]

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
  end

  def update
  end

  private

  def prize_params
    params.require(:prize).permit(:description, :image_url, :game_id)
  end

  def get_prize
    @prize = Prize.find_by(id: params[:id])
  end
end