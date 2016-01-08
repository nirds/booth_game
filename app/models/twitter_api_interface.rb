class TwitterApiInterface
  require 'net/http'

  def self.search
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
    end

    client.search("@nirdllc", result_type: "recent").take(3).collect do |tweet|
      pp "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end
end