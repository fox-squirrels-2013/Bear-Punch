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
  end

  private

  def setup_user_client
    @graph = Koala::Facebook::API.new(self.access_token)
  end

end
