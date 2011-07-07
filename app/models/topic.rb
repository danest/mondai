# == Schema Information
# Schema version: 20110717064039
#
# Table name: topics
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Topic < ActiveRecord::Base
  
  validates_uniqueness_of :name, :uniqueness => { :case_sensitive => false }
  has_many :enrollments
  has_many :questions, :through => :enrollments
  attr_accessible :name
end
