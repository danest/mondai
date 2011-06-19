class Question < ActiveRecord::Base
  #before_save :check_for_existing_skill
  def check_for_existing_skill
    if self.topics
      existing_skill = Topic.first
      if existing_skill
        self.topics = existing_skill
      end
    end
  end
  
  attr_accessible :content, :description, :name, :topic_names
  belongs_to :user
  has_many :enrollments
  has_many :topics, :through => :enrollments
  has_many :answers, :dependent => :destroy
  #belongs_to :topic, :autosave => true
  #accepts_nested_attributes_for :topics
  validates :content, :presence => true
  attr_writer :topic_names
  after_save :assign_topics
  default_scope :order => 'questions.created_at DESC'
  
  def normalized_name
    self.content.gsub(' ', '-').gsub(/[^a-zA-Z0-9\_\-\.]/, '')
  end
  
  def topic_names
    @topic_names || topics.map(&:name).join(' ')
  end
  
  
  def assign_topics
    if @topic_names
      self.topics = @topic_names.split(/\s+/).map do |name|
        Topic.find_or_create_by_name(name)
      end
    end
  end
  
  #Return Question that is belongs to the followed user to show in the current user profile page
  #scope :from_users_followed_by, lamda { |user| user_followed_by(user) }
  #scope :from_questions_followed_by, lamda { |question| question_followed_by(user) }
  
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

