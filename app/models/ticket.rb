class Ticket < ActiveRecord::Base
  validates :game_contestant_id, presence: true
  validates :game_id, presence: true

  belongs_to :game_contestant
  belongs_to :game

  TICKETS_FOR_SIGN_UP = 1
  TICKETS_FOR_TWEETING = 2
  TICKETS_FOR_BEING_RETWEETED = 2

  def self.after_tweeting_count
    TICKETS_FOR_SIGN_UP + TICKETS_FOR_TWEETING
  end

  def self.max_count
    TICKETS_FOR_SIGN_UP + TICKETS_FOR_TWEETING + TICKETS_FOR_BEING_RETWEETED
  end
end