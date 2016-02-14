module GameUtilities
  class DripApi
    def add_or_update_subscribers(game)
      client = get_client
      client.create_or_update_subscribers(contestants_as_subscribers(game))
    end

    def enroll_contestants_in_campaign(game)
      client = get_client
      subscribers = contestants_as_subscribers(game)
      subscribers.each do |s|
        client.subscribe(s[:email], game.campaign)
      end
    end

    private

    def get_client
      client = Drip::Client.new do |c|
        c.api_key  = ENV['DRIP_API_TOKEN']
        c.account_id    = ENV['DRIP_ACCT_ID']
      end
    end

    def contestants_as_subscribers(game)
      contact_ids = GameContestant.where(game_id: game.id).map { |c| c.contact_id }
      contacts = Contact.where(id: contact_ids)
      contacts_as_subscribers = contacts.map { |c| {email: c.email }}
    end
  end
end
