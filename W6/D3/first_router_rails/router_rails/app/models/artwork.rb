# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  favorite   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :image_url, presence: true, uniqueness: true
  validates :artist_id, presence: true, uniqueness: { scope: :title }

  belongs_to :artist, dependent: :destroy,
    foreign_key: :artist_id,
    class_name: :User

  has_many :artwork_shares, dependent: :destroy,
  foreign_key: :artwork_id,
  class_name: :ArtworkShare

  has_many :comments,
    foreign_key: :artwork_id,
    class_name: :Comment

  has_many :shared_viewers,
  through: :artwork_shares,
  source: :viewer

  has_many :likes,
    as: :liked
  
  has_many :collections,
    foreign_key: :artwork_id,
    class_name: :Collections
end
