module GameUtilities
  class DripApi
    def add_or_update_subscribers(game)
      client = get_client
      ids = GameContestant.where(game_id: game.id).map { |c| c.contact_id }
      contacts = Contact.where(id: ids)
      contacts_as_subscribers = contacts.map { |c| {email: c.email }}
      client.create_or_update_subscribers(contacts_as_subscribers)
    end

    private

    def get_client
      client = Drip::Client.new do |c|
        c.api_key  = ENV['DRIP_API_TOKEN']
        c.account_id    = ENV['DRIP_ACCT_ID']
      end
    end
  end
end

