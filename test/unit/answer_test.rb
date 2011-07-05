require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


# == Schema Information
#
# Table name: answers
#
#  id          :integer         not null, primary key
#  content     :text
#  user_id     :integer
#  question_id :integer
#  count       :integer         default(0), not null
#  created_at  :datetime
#  updated_at  :datetime
#

