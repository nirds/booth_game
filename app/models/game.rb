class Game < ActiveRecord::Base
  validates :twitter_handle, presence: true
  validates :hash_tag, presence: true

  has_many :tickets, dependent: :destroy
  has_many :contestants, through: :game_contestants

  has_one :most_tweeted

  def update_score
    updater = GameUtilities::Updater.new
    updater.update_game(id, twitter_handle, hash_tag)
  end
end