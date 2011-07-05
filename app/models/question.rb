class Question < ActiveRecord::Base

  attr_accessible :content, :description, :name, :topic_names
  attr_accessor :topic_names
  belongs_to :user
  has_many :enrollments
  has_many :topics, :through => :enrollments
  has_many :answers, :dependent => :destroy
  #belongs_to :topic, :autosave => true
  #accepts_nested_attributes_for :topics
  validates :content, :presence => true
  
  #generates a method topic_names= that sets the value of the instance variable @topic_names
  #attr_writer :topic_names
  after_save :assign_topics
  default_scope :order => 'questions.created_at DESC'
  
  def normalized_name
    self.content.gsub(' ', '-').gsub('.', '').gsub(/[^a-zA-Z0-9\_\-\.]/, '')
  end
  
  def topic_names
    #this allows to see the topics when we click edit
    @topic_names || topics.map(&:name).join(' ')
  end
  
  
  def assign_topics
    if @topic_names
      #assign the correct associations in our model
      self.topics = @topic_names.split(/\s+/).map do |name|
        Topic.find_or_create_by_name(name)
      end
    end
  end
  
  def self.search(search)
    if !search.empty?
      where('content LIKE ?', "%#{search}%")
    end
  end
  
  #Return Question that is belongs to the followed user to show in the current user profile page
  scope :from_users_followed_by, lambda { |user| user_followed_by(user) }
  scope :from_questions_followed_by, lambda { |question| question_followed_by(user) }
  scope :from_topic_followed_by, lambda { |topic| topic_followed_by(user)}
  
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
    
    def self.topic_followed_by(user)
      t_following_name = %(SELECT t_followed FROM t_relationship WHERE t_follower_id = :user_id)
      where("user_id IN (#{t_following_ids}) OR user_id = :user_id", {:user_id => user})
    end
    

end


# == Schema Information
#
# Table name: questions
#
#  id          :integer         not null, primary key
#  content     :text
#  description :text
#  user_id     :integer
#  has_answer  :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

