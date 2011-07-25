class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.text :content
      t.integer :user_id
      t.integer :question_id
      t.integer :count, :default => 0, :null => false
      t.timestamps
    end
    add_index :answers, :user_id
    add_index :answers, :question_id
  end

  def self.down
    drop_table :answers
  end
end
