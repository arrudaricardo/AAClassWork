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

class Collect < ApplicationRecord
  validates :user_id, presence: true, uniqueness: true
  validates :artwork_id, presence: true, uniqueness: { scope: :user_id }

  belongs_to :user,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork
end
