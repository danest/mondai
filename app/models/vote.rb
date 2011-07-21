# == Schema Information
# Schema version: 20110722144150
#
# Table name: votes
#
#  id         :integer         not null, primary key
#  value      :integer
#  answer_id  :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Vote < ActiveRecord::Base
  belongs_to :answer
  belongs_to :user
  attr_accessible :answer_id, :user_id
end
