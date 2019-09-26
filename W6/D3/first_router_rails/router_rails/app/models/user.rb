# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  
  has_many :artists,
    foreign_key: :artist_id,
    class_name: :Artwork

  has_many :comments, dependent: :destroy,
    foreign_key: :user_id,
    class_name: :Comment

  has_many :viewers,
  foreign_key: :viewer_id,
  class_name: :ArtworkShare

  has_many :shared_artworks,
  through: :viewers,
  source: :artwork

  has_many :likes, 
    foreign_key: :user_id,
    class_name: :Like

  has_many :favorite_shared_artworks,
    foreign_key: :favorite_user_id,
    class_name: :ArtworkShare

  has_many :collections,
    foreign_key: :artwork_id,
    class_name: :Collection
end
