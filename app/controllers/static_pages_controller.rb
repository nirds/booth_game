class StaticPagesController < ApplicationController
  def home
    most_recent_game = Game.last
    @game = most_recent_game if most_recent_game && !most_recent_game.ended_at
  end
end