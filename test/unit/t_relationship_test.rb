require 'test_helper'

class TRelationshipTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: t_relationships
#
#  id            :integer         not null, primary key
#  t_follower_id :integer
#  t_followed    :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

