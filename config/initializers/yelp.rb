require 'yelp'

Yelp.client.configure do |config|
  config.consumer_key = ENV['PUBLIC_KEY']
  config.consumer_secret = ENV['SECRET_KEY']
  config.token = ENV['MY_TOKEN']
  config.token_secret = ENV['TOKEN_SECRET']
end
