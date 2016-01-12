class Game < ActiveRecord::Base
  validates :twitter_handle, presence: true
  validates :hash_tag, presence: true

  has_many :tickets, dependent: :destroy
  has_many :game_contestants, dependent: :destroy
  has_many :contacts, through: :game_contestants

  has_one :most_tweeted

  def update_score
    client = GameUtilities::TwitterApi.new
    tweets =  client.get_tweets(twitter_handle, hash_tag)
    updater = GameUtilities::Updater.new
    updater.update_game(id, tweets)
  end
end