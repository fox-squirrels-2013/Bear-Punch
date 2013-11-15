class CreateFacebookAccounts < ActiveRecord::Migration
  def change
    create_table :facebook_accounts do |t|
      t.belongs_to :user
      t.string :username
      t.string :fb_id
      t.string :access_token
      t.timestamps
    end
  end
end
