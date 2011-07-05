require 'test_helper'

class QRelationshipTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: q_relationships
#
#  id            :integer         not null, primary key
#  q_follower_id :integer
#  q_followed_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

