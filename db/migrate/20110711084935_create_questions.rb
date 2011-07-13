class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :content
      t.string :description
      t.integer :user_id
      t.boolean :has_answer


      t.timestamps
    end
    add_index :questions, :user_id
  end

  def self.down
    drop_table :questions
  end
end
