class Game < ActiveRecord::Base
  validates :twitter_handle, presence: true
  validates :hash_tag, presence: true

  has_many :tickets, dependent: :destroy
  has_many :prizes, dependent: :destroy
  has_many :game_contestants, dependent: :destroy
  has_many :contacts, through: :game_contestants

  def update_score
    client = GameUtilities::TwitterApi.new
    tweets =  client.get_tweets(twitter_handle, hash_tag)
    updater = GameUtilities::Updater.new
    updater.update_game(id, tweets)
  end

  def enroll_contestants
    client = GameUtilities::DripApi.new
    client.add_or_update_subscribers(self)
    client.enroll_contestants_in_campaign(self)
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

    if sorted_contestants[0].retweet_count == 0
      return []
    elsif !sorted_contestants[1] || sorted_contestants[0].retweet_count > sorted_contestants[1].retweet_count
      mrt = [{  contact: Contact.find_by(id: sorted_contestants.first.contact_id),
                retweet_count: sorted_contestants.first.retweet_count }]
      (1..2).each do |i|
        contestant = sorted_contestants[i]
        if contestant
          mrt << {  contact: Contact.find_by(id: contestant.contact_id),
                    retweet_count: contestant.retweet_count }
        end
      end
      return mrt
    else
      max = sorted_contestants[0].retweet_count
      mrt = []
      contestants = sorted_contestants.reject { |c| c.retweet_count != max }
      contestants.each do |c|
        mrt << { contact: Contact.find_by(id: c.contact_id),
                 retweet_count: c.retweet_count }
      end
      return mrt
    end
  end
end