class CreateTwitterAccounts < ActiveRecord::Migration
  def change
    create_table :twitter_accounts do |t|
      t.belongs_to :user
      t.string :username
      t.string :oauth_token
      t.string :oauth_secret
      t.timestamps
    end
  end
end
