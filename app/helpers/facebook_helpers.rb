 helpers do

  def input_generator
    a = ["Search inside yourself", "I liked your shirt today", "Awesome herokuapp, keep it up", "Good morning", "Wanna hang out?", "Have you seen my Buddy Herb?", "This vodka tastes a lot like I'm not going code tomorrow",
            "Take a break from coding to go protest your upcoming state of unemployment",
            "Let me know if you need me to be of absolutely no assistance to you",
            "I could have sworn I mentioned my propensity to violent, psychotic alcoholic blackouts during phase 1",
            "I really enjoyed awkwardly pairing with you",
            "It was really great chatting with you once I knew you understood javascript",
            "I'd rather not get into detail about how I'm doing in phase 2",
            "I'm socially awkward in three languages - Ruby, Javascript, and HTML",
            "You can accomplish anything you put your mind to as long as that thing is failure",
            "I can't wait to be ashamed of what I do during cohort cohesion night",
            "When DBC feels overwhelming, remember that you're going to die"]
            a.shuffle.first
    
  end

  def initialize_rest_access
  
  @graph = Koala::Facebook::API.new(oauth_consumer_fb)

  end
  
  def get_users_friends_ids
    # Array of friends ids
    @data = Friend.where(facebook_account_id: session[:id] )  
    @data.map do |object|
      object.friend_id
    end
  end

  # def test_helper_to_make_sure_we_know_whats_going_on
  # p @rest.methods - Object.methods
  # end
  

  # def get_posts
  #  @graph.put_wall_post("I feel foxy today")
  #  end

  def get_comments
    # get all comments from user
  end

  def get_posting_dates
    # days a user posted
  end 

  def get_location
    # get location from user
  end

  def get_user_photo
    # get user image
  end

  def create_posts
    # Post on a friends wall
     array_of_friends  = get_users_friends_ids

  friend_id_who_gets_it = array_of_friends[0] # shuffle later

    @graph.put_wall_post(message: "This is a random post, cause i feel like punching bears",  )

    put_connections(target_id: "me", "feed", attachment.merge({:message => message}), options, &block)


  end
  
  def create_comments
    # create comments
  end

  def add_image
     #add image 
   end

   def get_friends
    # get all friends from user
  end

  def add_friends
    # add friends
  end  

  def show_timeline
    # display timeline
  end  
end  