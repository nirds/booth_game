class ContestantsController < ApplicationController
  def new
  end

  def create
  end

  def index
    @contestants = Contestant.all
  end
end