require 'twitter'

class TwitterFollowers
  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['API_KEY']
      config.consumer_secret     = ENV['API_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_SECRET']
    end
  end

  def deck_for(user)
    deck(client.followers(user).first(100))
  end

  private

  def deck(users)
    users.map { |user| card(user) }
  end

  def card(user)
    Card.new(screen_name: user.screen_name,
             followers_count: user.followers_count,
             friends_count: user.friends_count)
  end

  def twitter_config
    Rails.application.config.twitter
  end
end
