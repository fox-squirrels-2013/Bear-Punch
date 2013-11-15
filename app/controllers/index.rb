get '/' do
  @user = User.find_by_id(session[:id])
  if @user
    @twitter = TwitterAccount.find_by_user_id(session[:id])
    if @twitter
      curr_client = Twitter::Client.new(
        :consumer_key => ENV['TWITTER_KEY'],
        :consumer_secret => ENV['TWITTER_SECRET'],
        :oauth_token => @twitter.oauth_token,
        :oauth_token_secret => @twitter.oauth_secret)
      tweets = curr_client.user_timeline(@twitter.username, :count => 10)
      @tweets = tweets.map {|tweet| tweet.text}
    end
    @facebook = FacebookAccount.find_by_user_id(session[:id])
    if @facebook
      @graph = Koala::Facebook::API.new(@facebook.access_token)
      messages = @graph.fql_query("SELECT message FROM stream WHERE source_id = me()")
      @messages = messages.map {|x| x["message"]}
    end
  end
  erb :index
end

post '/tweet' do
  @user = User.find_by_id(session[:id])
  @twitter = TwitterAccount.find_by_user_id(session[:id])
  curr_client = Twitter::Client.new(
    :consumer_key => ENV['TWITTER_KEY'],
    :consumer_secret => ENV['TWITTER_SECRET'],
    :oauth_token => @twitter.oauth_token,
    :oauth_token_secret => @twitter.oauth_secret)
  curr_client.update(params[:tweet])
  redirect '/'
end

post '/facebook' do 
  text_to_post = params[:wall_post]
  @facebook = FacebookAccount.find_by_user_id(session[:id])
  graph = Koala::Facebook::API.new(@facebook.access_token)
  graph.put_wall_post(text_to_post)
  redirect '/'
end  

post '/' do
  @user = User.create(params) 

  if @user
    session[:email] = params[:email]
    session[:first_name] = @user.first_name
    session[:id] = @user.id
    # add Sinatra Flash message to say 'account created! welcome to your new page'
  else
    # deliver Sinatra Flash error message
  end
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by_email(params[:email])
  if @user && @user.password == params[:password]
    session[:email] = params[:email]
    session[:first_name] = @user.first_name
    session[:id] = @user.id
    redirect '/'
  else
    redirect '/login'
    # add Sinatra Flash message to say it failed
  end
end

get '/sign_in_FB' do
  redirect facebook_auth_url
end

get '/sign_in_twitter' do
  redirect request_token_twitter.authorize_url
end

get '/sign_out' do
  session.clear
  redirect '/'
end

get '/auth_fb' do
  @fb_access_token = get_fb_access(params[:code])
  @user = User.find_by_id(session[:id])
  FacebookAccount.create(:user_id => @user.id, :access_token => @fb_access_token)
  redirect '/'
end

get '/auth' do
  @access_token = request_token_twitter.get_access_token(:oauth_verifier => params[:oauth_verifier])
  session.delete(:request_token)
  @user = User.find_by_id(session[:id])
  TwitterAccount.create(:user_id => @user.id, :username => @access_token.params[:screen_name], :oauth_token => @access_token.token, :oauth_secret => @access_token.secret)
  redirect '/'  
end

