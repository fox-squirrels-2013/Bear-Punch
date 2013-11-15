helpers do
  def oauth_consumer_twitter
    raise RuntimeError, "You must set TWITTER_KEY and TWITTER_SECRET in your server environment." unless ENV['TWITTER_KEY'] and ENV['TWITTER_SECRET']
    @consumer ||= OAuth::Consumer.new(
      ENV['TWITTER_KEY'],
      ENV['TWITTER_SECRET'],
      :site => "https://api.twitter.com"
    )
  end

  def request_token_twitter
    if not session[:request_token]
      # this 'host_and_port' logic allows our app to work both locally and on Heroku
      host_and_port = request.host
      host_and_port << ":9393" if request.host == "localhost"

      # the `oauth_consumer` method is defined above
      session[:request_token] = oauth_consumer_twitter.get_request_token(
        :oauth_callback => "http://#{host_and_port}/auth"
      )
    end
    session[:request_token]
  end

  def oauth_consumer_fb
    raise RuntimeError, "You must set FACEBOOK_KEY and FACEBOOK_SECRET in your server environment." unless ENV['FACEBOOK_KEY'] and ENV['FACEBOOK_SECRET']
    # 
    @oauth = Koala::Facebook::OAuth.new(ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], "http://localhost:9393/auth_fb")
  end

  def facebook_auth_url
     oauth_consumer_fb.url_for_oauth_code(:permissions => "publish_stream, read_stream, email, friends_interests, friends_relationship_details, friends_relationships, publish_stream, read_friendlists, read_mailbox, share_item, sms, status_update, user_location")
  end

  def get_fb_access(code)
    @access_token = oauth_consumer_fb.get_access_token(code)
  end
end
