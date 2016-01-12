class GameContestant < ActiveRecord::Base
  validates :contact_id, presence: true
  validates :game_id, presence: true

  belongs_to :game
  belongs_to :contact

  has_many :tickets, dependent: :destroy
end