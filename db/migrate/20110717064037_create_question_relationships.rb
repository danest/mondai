class CreateQuestionRelationships < ActiveRecord::Migration
  def self.up
    create_table :q_relationships do |t|
      t.integer :q_follower_id
      t.integer :q_followed_id

      t.timestamps
    end
    add_index :q_relationships, :q_follower_id
    add_index :q_relationships, :q_followed_id 
  end

  def self.down
    drop_table :q_relationships
  end
end
