class Game < ActiveRecord::Base
  validates :twitter_handle, presence: true
  validates :hash_tag, presence: true

  has_many :tickets, dependent: :destroy
  has_many :game_contestants, dependent: :destroy
  has_many :contacts, through: :game_contestants

  def update_score
    client = GameUtilities::TwitterApi.new
    tweets =  client.get_tweets(twitter_handle, hash_tag)
    updater = GameUtilities::Updater.new
    updater.update_game(id, tweets)
  end

  def select_winner(tickets)
    winning_ticket = tickets.sample
    winner = winning_ticket.game_contestant
    winner.update_attributes(is_drawing_winner: true)
    return Contact.find_by(id: winner.contact_id)
  end

  def get_most_retweeted
    contestants = GameContestant.where(game_id: id).collect.to_a
    sorted_contestants = contestants.sort_by { |c| c.retweet_count }.reverse

    if sorted_contestants[0].retweet_count > sorted_contestants[1].retweet_count
      return [sorted_contestants.first], sorted_contestants
    else
      max = sorted_contestants[0].retweet_count
      return sorted_contestants.reject { |c| c.retweet_count != max }, sorted_contestants
    end
  end
end