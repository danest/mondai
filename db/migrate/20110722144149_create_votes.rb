class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.integer :value
      t.references :answer
      t.references :user

      t.timestamps
    end
    add_index :votes, :answer_id
    add_index :votes, :user_id
    add_index :votes, [:answer_id, :user_id], :unique => true
  end

  def self.down
    drop_table :votes
  end
end
