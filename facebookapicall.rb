require 'fb_graph'
require 'yaml'

app = FbGraph::Application.new('465495653562684', :secret => 'a452120d11df6ee6b9dfe4b1c83540fa')
app.get_access_token

token = "465495653562684|psqtzGF27iSbITEdEk6tkM-OFGQ"
user = FbGraph::User.fetch('benedikt.girz', :access_token => "465495653562684|psqtzGF27iSbITEdEk6tkM-OFGQ")

me = User.new('me', :access_token => "465495653562684|psqtzGF27iSbITEdEk6tkM-OFGQ")
me.home

class FB < ActiveRecord::Base 

  def self.get_posts
  # get all posts from user  

  end

  def self.get_comments
    # get all comments from user
  end

  def self.get_posting_dates
    # days a user posted
  end

  def self.get_location
    # get location from user
  end

  def self.get_user_photo
    # get user image
  end

  def self.create_posts
    # create posts
  end
  
  def self.create_comments
    # create comments
  end

  def self.add_image
     #add image 
  end

  def self.get_friends
    # get all friends from user
  end

  def self.add_friends
    # add friends
  end  

  def self.show_timeline
    # display timeline
  end  
end  

