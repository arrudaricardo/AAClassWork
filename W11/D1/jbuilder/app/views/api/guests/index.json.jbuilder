# json.array! @guests do |guest|
#     json.name guest.name
#     json.age guest.age
#     json.favoriteColor guest.favorite_color
# end

json.partial! partial: "guest", guest: @guests, action: :index
