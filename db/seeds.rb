game = Game.create(twitter_handle: "beyonce", hash_tag: "lipsyncbattle")
api = GameUtilities::TwitterApi.new
tweets = api.get_tweets(game.twitter_handle, game.hash_tag)

tweets.each_with_index do |t, i|
  unless Contact.find_by(twitter_handle: t.user.screen_name)
    FactoryGirl.create(:contact, email: "test#{i}@example.com", twitter_handle: t.user.screen_name)
  end
end

Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')