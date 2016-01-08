class TwitterApiInterface
  require 'net/http'

  def self.search
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
    end

    results = client.search("@nirdllc", { result_type: "recent", count: 100 }).collect

    results.each do |tweet|
      next if tweet.text[0..1] == "RT"

      contestant = Contestant.find_by(twitter_handle: tweet.user.screen_name)

      if contestant
        unless contestant.tickets.count > 1
          Ticket::TICKETS_FOR_TWEETING.times { Ticket.create(contestant_id: contestant.id) }
        end

        if tweet.retweet_count > 0
          contestant.update_attributes(retweet_count: tweet.retweet_count)
          pp contestant.retweet_count

          if contestant.tickets.count < 6
            Ticket::TICKETS_FOR_BEING_RETWEETED.times { Ticket.create(contestant_id: contestant.id) }
          end
        end
      end
    end
  end
end