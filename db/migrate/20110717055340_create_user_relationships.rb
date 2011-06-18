class CreateUserRelationships < ActiveRecord::Migration
  def self.up
    create_table :u_relationships do |t|
      t.integer :u_follower_id
      t.integer :u_followed_id

      t.timestamps
    end
    add_index :u_relationships, :u_follower_id
    add_index :u_relationships, :u_followed_id
    add_index :u_relationships, [:u_follower_id, :u_followed_id], :unique => true
  end

  def self.down
    drop_table :u_relationships
  end
end
