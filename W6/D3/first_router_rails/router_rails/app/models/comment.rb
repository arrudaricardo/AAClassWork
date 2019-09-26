# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  user_id    :integer
#  artwork_id :integer
#

class Comment < ApplicationRecord
  belongs_to :user,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork

  has_many :likes,
    as: :liked
    # foreign_key: :liked_id,
    # class_name: :Like
end
