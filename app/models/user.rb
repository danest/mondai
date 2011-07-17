class User < ActiveRecord::Base
  devise :omniauthable
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,:name, :password, :remember_me, :uid, :picture, :fb_link #:password_confirmation, :remember_me
  #attr_accessible :name. :email
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  
  validates :name, :presence => true
  #we want it to have an email, and make sure the email is unique
  validates :email, :presence => true,
                    #:format => { :with => :email_regex },
                    :uniqueness => { :case_sensitive => false }
  
  has_many :questions, :dependent => :destroy
  has_many :answers, :dependent => :destroy
  
  # User Relationship model
  has_many :user_relationship, :foreign_key => "user_follower_id", 
                                :dependent => :destroy
  has_many :user_following, :through => :user_relationship, :source => :user_followed
  
  has_many :user_reverse_relationship, :foreign_key => "user_followed_id",
                                      :class_name => "UserRelationship",
                                      :dependent => :destroy
  has_many :user_followers, :through => :user_reverse_relationship
  
  def user_following?(user_followed)
    user_relationship.find_by_user_followed_id(user_followed)
  end
  
  def follow_user!(user_followed)
    user_relationship.create!(:user_followed_id => user_followed.id)
  end
  
  def unfollow_user!(user_followed)
    user_relationship.find_by_user_followed_id(user_followed).destroy
  end
  
  # Question Relationship model
  
 
  # Need to add followed topic, followed user, followed questions question and own question
  def feed
    # followed user
    Question.from_users_followed_by(self)
  end
  
end


# == Schema Information
#
# Table name: users
#
#  id                   :integer         not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  reset_password_token :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer         default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  name                 :string(255)
#  uid                  :string(255)
#  picture              :string(255)
#  fb_link              :string(255)
#

