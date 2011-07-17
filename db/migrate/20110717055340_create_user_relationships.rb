class CreateUserRelationships < ActiveRecord::Migration
  def self.up
    create_table :user_relationships do |t|
      t.integer :user_follower_id
      t.integer :user_followed_id

      t.timestamps
    end
    add_index :user_relationships, :user_follower_id
    add_index :user_relationships, :user_followed_id
    add_index :user_relationships, [:user_follower_id, :user_followed_id], :unique => true
  end

  def self.down
    drop_table :user_relationships
  end
end
