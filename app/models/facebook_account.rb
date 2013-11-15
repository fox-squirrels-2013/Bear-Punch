class FacebookAccount < ActiveRecord::Base
  belongs_to :user
  has_many :friends

  after_create :get_profile_info

  def get_profile_info
    graph = setup_user_client
    user = graph.get_object("me")
    self.fb_id = user["id"]
    self.username = user["username"]
    self.save

    allfriends = graph.get_connections("me", "friends").map { |x| x["id"] }

    allfriends.each {|x| Friend.create(:facebook_account_id => self.id, :friend_id => x  )}
    
  end

  private

  def setup_user_client
    @graph = Koala::Facebook::API.new(self.access_token)
  end

end
