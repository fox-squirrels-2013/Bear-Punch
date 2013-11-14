class FacebookAccount < ActiveRecord::Base
  belongs_to :user
  after_create :get_profile_info
  after_save
  before_create
  before_save

  def get_profile_info
    setup_user_client
    #  setup koala client
    # make a call for profile info
    # save it to the some table
  end

  private

  def setup_user_client
    @rest = Koala::Facebook::API.new(self.access_token)
  end

end
