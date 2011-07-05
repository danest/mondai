class Answer < ActiveRecord::Base
  attr_accessible :content, :user_id, :count
  belongs_to :user
  belongs_to :question
  #validates :content, :presence => true
  default_scope :order => 'answers.count DESC'
end


# == Schema Information
#
# Table name: answers
#
#  id          :integer         not null, primary key
#  content     :text
#  user_id     :integer
#  question_id :integer
#  count       :integer         default(0), not null
#  created_at  :datetime
#  updated_at  :datetime
#

