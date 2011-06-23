class CreateTRelationships < ActiveRecord::Migration
  def self.up
    create_table :t_relationships do |t|
      t.integer :t_follower_id
      t.string :t_followed

      t.timestamps
    end
    add_index :t_relationships, :t_follower_id 
  end

  def self.down
    drop_table :t_relationships
  end
end
