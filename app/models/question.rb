class Question < ActiveRecord::Base
  attr_accessible :content, :description
  belongs_to :user
  has_many :answers, :dependent => :destroy
  validates :content, :presence => true
  default_scope :order => 'questions.created_at DESC'
  #normalized_name = self.content.gsub(' ', '-').gsub(/[^a-zA-Z0-9\_\-\.]/, '')
  
  def normalized_name
    self.content.gsub(' ', '-').gsub(/[^a-zA-Z0-9\_\-\.]/, '')
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

