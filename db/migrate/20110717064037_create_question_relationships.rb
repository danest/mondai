class CreateQuestionRelationships < ActiveRecord::Migration
  def self.up
    create_table :question_relationships do |t|
      t.integer :user_follower_id
      t.integer :question_followed_id

      t.timestamps
    end
    add_index :question_relationships, :user_follower_id
    add_index :question_relationships, :question_followed_id 
  end

  def self.down
    drop_table :question_relationships
  end
end
