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
#  content     :string(255)
#  user_id     :integer
#  question_id :integer
#  vote_up     :integer
#  vote_down   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

