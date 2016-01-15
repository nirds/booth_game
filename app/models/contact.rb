class Contact < ActiveRecord::Base
  validates :email, uniqueness: {case_sensitive: false}, presence: true
  validates :twitter_handle, uniqueness: {case_sensitive: false}, presence: true
  validates :name, presence: true
  validates :phone, presence: true

  has_many :game_contestants, dependent: :destroy
  has_many :games, through: :game_contestants
end