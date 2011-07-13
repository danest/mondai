class Answer < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  belongs_to :question
  validates :content, :presense => true
  default_scope :order => 'answers.created_at DESC'

end
