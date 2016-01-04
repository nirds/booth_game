class Ticket < ActiveRecord::Base
  validates :contestant_id, presence: true

  belongs_to :contestant
end