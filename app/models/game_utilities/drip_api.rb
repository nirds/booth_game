module GameUtilities
  class DripApi
    def some_method
    end

    # private

    def get_client
      client = Drip::Client.new do |c|
        c.api_key  = ENV['DRIP_API_TOKEN']
        c.account_id    = ENV['DRIP_ACCT_ID']
      end
    end
  end
end