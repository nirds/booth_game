class TwitterApiInterface
  def get_tweets(handle, hash_tag)
    client = get_client
    client.search("@#{handle} ##{hash_tag} -rt", { result_type: "recent", count: 100 }).collect
  end

  private

  def get_client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
    end
  end
end