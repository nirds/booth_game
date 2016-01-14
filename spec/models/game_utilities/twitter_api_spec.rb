require 'rails_helper'

RSpec.describe GameUtilities::TwitterApi, :type => :model do
  describe 'get tweets' do
    it 'returns an array of recent tweets' do
      VCR.use_cassette('beyonce_tweets', :match_requests_on => [:headers]) do
        api = GameUtilities::TwitterApi.new
        tweets = api.get_tweets('beyonce', 'lipsyncbattle')
        first_tweet_text = "#lipsyncBattle @channingtatum &amp; @jennaldewan were Xcellent w/ @Beyonce &amp; @PaulaAbdul such an entertaining show @chrissyteigen Hugs Happy 4U!"
        expect(tweets.class).to be(Enumerator)
        expect(tweets.first.text).to eq(first_tweet_text)
      end
    end
  end
end