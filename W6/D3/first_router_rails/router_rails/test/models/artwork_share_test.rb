# == Schema Information
#
# Table name: artwork_shares
#
#  id               :bigint           not null, primary key
#  artwork_id       :integer
#  viewer_id        :integer
#  favorite_user_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class ArtworkShareTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
