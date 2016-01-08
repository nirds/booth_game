class Ticket < ActiveRecord::Base
  validates :contestant_id, presence: true

  belongs_to :contestant

  TICKETS_FOR_TWEETING = 4
  TICKETS_FOR_BEING_RETWEETED = 5
end