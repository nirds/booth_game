module ApplicationHelper
  include TweetButton

  TweetButton.default_tweet_button_options = {via: nil, url: 'http://game.nirdhost.com/'}
end
