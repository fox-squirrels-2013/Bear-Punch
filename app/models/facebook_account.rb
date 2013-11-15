class FacebookAccount < ActiveRecord::Base
  belongs_to :user
  after_create :get_profile_info

  def get_profile_info
    graph = setup_user_client
    
     # setup koala client

    # make a call for profile info
    # save it to the some table
  end

  private

  def setup_user_client
    @graph = Koala::Facebook::API.new(self.access_token)
  end

end
