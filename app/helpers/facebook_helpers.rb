 helpers do

  def initialize_rest_access
  
  @graph = Koala::Facebook::API.new(oauth_consumer_fb)

  end
  

  # def test_helper_to_make_sure_we_know_whats_going_on
  # p @rest.methods - Object.methods
  # end
  

  def get_posts
   @graph.put_wall_post("I feel foxy today")
   end

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
    # create posts
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