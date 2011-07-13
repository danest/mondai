class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.string :content
      t.integer :user_id
      t.integer :question_id
      t.integer :vote_up
      t.integer :vote_down
      
      
      t.timestamps
    end
    add_index :answers, :user_id
    add_index :to_question, :questions_id
  end

  def self.down
    drop_table :answers
  end
end
