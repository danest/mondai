class Question < ActiveRecord::Base
  attr_accessible :content, :description
  belongs_to :user
  has_many :answers, :dependent => :destroy
  validates :content, :presence => true
  default_scope :order => 'questions.created_at DESC'
  
  def to_param
    normalized_name = content.gsub(' ', '-').gsub(/[^a-zA-Z0-9\_\-\.]/, '')
    "#{self.id}-#{normalized_name}"
  end
  
end

# == Schema Information
#
# Table name: questions
#
#  id          :integer         not null, primary key
#  content     :string(255)
#  description :string(255)
#  user_id     :integer
#  has_answer  :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

