require 'rails_helper'

RSpec.describe GameUtilities::TwitterApi, :type => :model do
  describe 'get tweets' do
    it 'returns an array of recent tweets' do
      VCR.use_cassette('beyonce_tweets') do
        api = GameUtilities::TwitterApi.new
        tweets = api.get_tweets('beyonce', 'lipsyncbattle')
        first_tweet_text = "I cannot explain how much joy &amp; laughter all of this brought me: https://t.co/ODCITz1F1J #LipSyncBattle @channingtatum @Beyonce @jennaldewan"
        expect(tweets.class).to be(Enumerator)
        expect(tweets.first.text).to eq(first_tweet_text)
      end
    end
  end
end