class GameContestant < ActiveRecord::Base
  belongs_to :game
  belongs_to :contact

  has_many :tickets, dependent: :destroy
end