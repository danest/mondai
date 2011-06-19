# == Schema Information
# Schema version: 20110717064037
#
# Table name: u_relationships
#
#  id            :integer         not null, primary key
#  u_follower_id :integer
#  u_followed_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class URelationship < ActiveRecord::Base
  attr_accessible :user_followed_id

  belongs_to :user_follower, :class_name => "User"
  belongs_to :user_followed, :class_name => "User"
end
