class Prize < ActiveRecord::Base
  validates :description, presence: true
  validates :image_url, presence: true

  scope :active, lambda { |game| where(game: game, won: false) }

  belongs_to :game
end