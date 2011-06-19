# == Schema Information
# Schema version: 20110717064037
#
# Table name: q_relationships
#
#  id            :integer         not null, primary key
#  q_follower_id :integer
#  q_followed_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class QRelationship < ActiveRecord::Base
  attr_accessible :question_followed_id
  
  belongs_to :question_follower, :class_name => "User"
  belongs_to :question_followed, :class_name => "Question"
end
