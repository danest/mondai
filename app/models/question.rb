class Question < ActiveRecord::Base
  attr_accessible :content, :description
  belongs_to :user
  has_many :answer, :dependent => destroy
  validates :content, :presense => true, :length => {:maximum => 200}
  default_scope :order => 'questions.created_at DESC'
  
end
