# == Schema Information
#
# Table name: collects
#
#  id         :bigint           not null, primary key
#  user_id    :integer
#  artwork_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CollectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
