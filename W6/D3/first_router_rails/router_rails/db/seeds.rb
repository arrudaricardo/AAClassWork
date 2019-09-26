# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null

users = User.create(username: "Pedro")
Artwork.create(title: "Nevermind", image_url: "http://nivaname.com/image.jpge", artist_id: users.id)

users = User.create(username: "Angela")
Artwork.create(title: "Subway", image_url: "http://subway.com/image.jpge", artist_id: users.id)

users = User.create(username: "Carlos")
Artwork.create(title: "Apple", image_url: "http://apple.com/image.jpge", artist_id: users.id)

users = User.create(username: "Lucas")
Artwork.create(title: "Google", image_url: "http://google.com/image.jpge", artist_id: users.id)