if action == :index
    json.array! guest do |g|
        json.name g.name
        json.age g.age
        json.favoriteColor g.favorite_color
    end
else
    # SHOW  
    json.extract! guest, :name, :age, :favorite_color

   json.gifts guest.gifts, :title, :description

end


