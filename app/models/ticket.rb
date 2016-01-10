class Ticket < ActiveRecord::Base
  validates :game_contestant_id, presence: true
  validates :game_id, presence: true

  belongs_to :game_contestant
  belongs_to :game

  TICKETS_FOR_TWEETING = 1
  TICKETS_FOR_BEING_RETWEETED = 4

  def self.max_ticket_count
    TICKETS_FOR_TWEETING + TICKETS_FOR_BEING_RETWEETED
  end
end