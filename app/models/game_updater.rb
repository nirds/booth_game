class GameUpdater
  def update_game(handle, hash_tag)
    client = TwitterApiInterface.new
    award_tickets client.get_tweets(handle, hash_tag)
  end

  private
  def award_tickets(all_tweets)
    all_tweets.each do |tweet|
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