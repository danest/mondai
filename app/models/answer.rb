class Answer < ActiveRecord::Base
  attr_accessible :content, :user_id
  belongs_to :user
  belongs_to :question
  #validates :content, :presence => true
  #default_scope :order => 'answers.created_at DESC'
end

# == Schema Information
#
# Table name: answers
#
#  id          :integer         not null, primary key
#  content     :string(255)
#  user_id     :integer
#  question_id :integer
#  vote_up     :integer
#  vote_down   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

