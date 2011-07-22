class TRelationship < ActiveRecord::Base
  attr_accessible :t_follower_id
  
  belongs_to :topic_follower, :class_name => "User"
  belongs_to :topic_name, :class_name => "Topic"
  
  validates :t_followed, :presence => true
  validates :t_follower_id, :presence => true

end
