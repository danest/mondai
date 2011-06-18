class UserRelationship < ActiveRecord::Base
  attr_accessible :user_followed_id

  belongs_to :user_follower, :class_name => "User"
  belongs_to :user_followed, :class_name => "User"
end
