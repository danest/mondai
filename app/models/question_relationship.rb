class QuestionRelationship < ActiveRecord::Base
  attr_accessible :question_followed_id
  
  belongs_to :question_follower, :class_name => "User"
  belongs_to :question_followed, :class_name => "Question"
end
