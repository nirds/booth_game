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
        next unless contact

        contestant = GameContestant.find_or_create_by(game_id: @game_id, contact_id: contact.id)
        ticket_hash = { game_contestant_id: contestant.id, game_id: @game_id }

        Ticket.create(ticket_hash) while contestant.tickets.count < Ticket.after_tweeting_count
        next unless tweet.retweet_count > 0

        contestant.update_attributes(retweet_count: tweet.retweet_count)
        Ticket.create(ticket_hash) while contestant.tickets.count < Ticket.max_count
      end
    end
  end
end