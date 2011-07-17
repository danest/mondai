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
  
  #Return Question that is belongs to the followed user to show in the current user profile page
  scope :from_users_followed_by, lamda { |user| user_followed_by(user)}
  scope :from_questions_followed_by, lamda { |question| question_followed_by(user)}
  
  private
    #Return an SQL condition statement for users followed by current user
    def self.user_followed_by(user)
      user_following_ids = %(SELECT u_followed_id FROM u_relationship WHERE u_follower_id = :user_id)
      where("user_id IN (#{user_following_ids}) OR user_id = :user_id", {:user_id => user})
    end
    
    def self.question_followed_by(user)
      q_following_ids = %(SELECT q_followed_id FROM q_relationship WHERE q_follower_id = :user_id)
      where("user_id IN (#{q_following_ids}) OR user_id = :user_id", {:user_id => user})
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

