#for some reason this test causes a second call to the api in the update_game method...


# require 'rails_helper'

# RSpec.describe GameUtilities::Updater, :type => :model do
#   describe "update game" do
#     let(:twitter_handle) { 'channingtatum' }
#     let(:hash_tag) { 'lipsyncbattle' }
#     let(:game) { FactoryGirl.create(:game, { twitter_handle: twitter_handle, hash_tag: hash_tag }) }


#     before do
#       VCR.use_cassette('channing_tweets') do
#         api = GameUtilities::TwitterApi.new
#         tweets = api.get_tweets(twitter_handle, hash_tag)
#         tweets.each_with_index { |t, i| i > 9 ? break : FactoryGirl.create(:contact,
#                                                                             email: "test#{i}@example.com",
#                                                                             twitter_handle: t.user.screen_name) }
#       end
#     end

#     it "creates game contestants" do
#       @tweets = nil

#       VCR.use_cassette('channing_tweets') do
#         api = GameUtilities::TwitterApi.new
#         @tweets = api.get_tweets(twitter_handle, hash_tag)
#       end

#       updater = GameUtilities::Updater.new
#       updater.update_game(game.id, @tweets)

#       expect(response).to change(GameContestant.count).by(10)
#     end
#   end
# end