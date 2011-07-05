require 'test_helper'

class URelationshipTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: u_relationships
#
#  id            :integer         not null, primary key
#  u_follower_id :integer
#  u_followed_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

