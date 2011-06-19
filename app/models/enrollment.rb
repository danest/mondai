# == Schema Information
# Schema version: 20110717064039
#
# Table name: enrollments
#
#  id          :integer         not null, primary key
#  question_id :integer
#  topic_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Enrollment < ActiveRecord::Base
  belongs_to :topic
  belongs_to :question
end
