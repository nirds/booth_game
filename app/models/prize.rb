class Prize < ActiveRecord::Base
  validates :description, presence: true
  validates :image_url, presence: true

  belongs_to :game
end