class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.belongs_to :facebook_account
      t.string :friend_id
    end
  end
end
