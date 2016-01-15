module GameUtilities
  class Updater
    def update_game(game_id, tweets)
      @game_id = game_id
      award_tickets tweets
    end

    private
    def award_tickets(all_tweets)
      all_tweets.each do |tweet|
        contact = Contact.find_by(twitter_handle: tweet.user.screen_name)
        contestant = find_or_create_contestant(contact.id) if contact

        if contestant && tweet.retweet_count > 0
          contestant.update_attributes(retweet_count: tweet.retweet_count)
          award_tickets_for_being_retweeted(contestant.id) if contestant.tickets.count < Ticket.max_ticket_count
        end
      end
    end

    def find_or_create_contestant(contact_id)
      contestant = GameContestant.find_by(game_id: @game_id, contact_id: contact_id)
      unless contestant
        contestant = GameContestant.create(game_id: @game_id, contact_id: contact_id)
        award_tickets_for_tweeting(contestant.id)
        return contestant
      end
    end

    def award_tickets_for_tweeting(contestant_id)
      Ticket::TICKETS_FOR_TWEETING.times{ Ticket.create(game_contestant_id: contestant_id, game_id: @game_id) }
    end

    def award_tickets_for_being_retweeted(contestant_id)
      Ticket::TICKETS_FOR_BEING_RETWEETED.times { Ticket.create(game_contestant_id: contestant_id, game_id: @game_id) }
    end
  end
end