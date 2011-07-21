class Answer < ActiveRecord::Base
  attr_accessible :content, :user_id, :count
  belongs_to :user
  belongs_to :question
  has_many :votes
  
  def total_sum
    self.votes.sum(:value)
  end

  #validates :content, :presence => true
  default_scope :include => :votes
  default_scope :order => 'votes.value DESC'
end


# == Schema Information
#
# Table name: answers
#
#  id          :integer         not null, primary key
#  content     :text
#  user_id     :integer
#  question_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

