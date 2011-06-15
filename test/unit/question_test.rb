require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
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

