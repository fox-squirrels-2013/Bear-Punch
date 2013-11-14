get '/' do
  erb :index # to be removed
  # erb :old_index
end

post '/' do # to be removed
  @user = User.create(params)
  # TODO: implement @twitter 
  if @user
    session[:email] = params[:email]
    session[:first_name] = params[:first_name]
    erb :index # or member's personal page -- whatever that is
    # add Sinatra Flash message to say 'account created! welcome to your new page'
  else
    # deliver Sinatra Flash error message
    erb :index
  end
end # to be removed

get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by_email(params[:email])
  if @user && @user.password == params[:password]
    session[:email] = params[:email]
    session[:first_name] = @user.first_name
    erb :index
  else
    redirect '/login'
    # add Sinatra Flash message to say it failed
  end
end

get '/sign_in' do
  # the `request_token` method is defined in `app/helpers/oauth.rb`
  redirect request_token.authorize_url
end

get '/sign_out' do
  session.clear
  redirect '/'
end

get '/auth' do
  # the `request_token` method is defined in `app/helpers/oauth.rb`
  @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
  # our request token is only valid until we use it to get an access token, so let's delete it from our session
  session.delete(:request_token)

  # at this point in the code is where you'll need to create your user account and store the access token

  erb :old_index
  
end