class AddFacebookToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :uid, :string
    add_column :users, :picture, :string
    add_column :users, :fb_link, :string
  end

  def self.down
    remove_column :users, :fb_link
    remove_column :users, :picture
    remove_column :users, :uid
  end
end
