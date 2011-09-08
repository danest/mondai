class AddIndexUidToUsers < ActiveRecord::Migration
  def self.up
    add_index :users, :uid
  end

  def self.down
    remove_index :users, :uid
  end
end
