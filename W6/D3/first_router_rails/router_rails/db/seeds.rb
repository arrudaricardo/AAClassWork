# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#  id         :bigint           not null, primary key
#  artwork_id :integer
#  viewer_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null

User.destroy_all
user1 = User.create(username: "Pedro")
user2 = User.create(username: "Angela")
user3 = User.create(username: "Carlos")
user4 = User.create(username: "Lucas")

Artwork.destroy_all
artwork1 = Artwork.create(title: "Nevermind", image_url: "http://nivaname.com/image.jpge", artist_id: user1.id, favorite: true)
artwork2 = Artwork.create(title: "Subway", image_url: "http://subway.com/image.jpge", artist_id: user2.id, favorite: false)
artwork3 = Artwork.create(title: "Apple", image_url: "http://apple.com/image.jpge", artist_id: user3.id, favorite: false)
artwork4 = Artwork.create(title: "Google", image_url: "http://google.com/image.jpge", artist_id: user4.id, favorite: true)

ArtworkShare.destroy_all
ArtworkShare.create(artwork_id: artwork1.id, viewer_id: user1.id, favorite_user_id: user2.id)
ArtworkShare.create(artwork_id: artwork2.id, viewer_id: user2.id, favorite_user_id: user4.id)
ArtworkShare.create(artwork_id: artwork3.id, viewer_id: user3.id, favorite_user_id: 0)
ArtworkShare.create(artwork_id: artwork4.id, viewer_id: user4.id, favorite_user_id: user3.id)

Comment.destroy_all
comment1 = Comment.create(body: "This sucks", user_id: user1.id, artwork_id: artwork1.id)
comment2 = Comment.create(body: "This rocks", user_id: user1.id, artwork_id: artwork2.id)
comment3 = Comment.create(body: "This sucks", user_id: user2.id, artwork_id: artwork3.id)
comment4 = Comment.create(body: "This sucks", user_id: user3.id, artwork_id: artwork4.id)

Like.destroy_all
Like.create(user_id: user1.id, liked_id: artwork1.id, liked_type: "Artwork")
Like.create(user_id: user1.id, liked_id: comment1.id, liked_type: "Comment")
Like.create(user_id: user2.id, liked_id: artwork2.id, liked_type: "Artwork")
Like.create(user_id: user3.id, liked_id: artwork3.id, liked_type: "Artwork")
Like.create(user_id: user3.id, liked_id: comment3.id, liked_type: "Comment")
Like.create(user_id: user4.id, liked_id: comment4.id, liked_type: "Comment")
