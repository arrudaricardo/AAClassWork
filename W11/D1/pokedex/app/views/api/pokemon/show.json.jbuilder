
json.pokemon do
    json.extract! @pokemon, :id, :name, :attack, :defense, :moves, :poke_type
    json.image_url asset_path(@pokemon.image_url)

    json.items_id do
        # json.some_key @pokemon.items :id
        json.array! [@pokemon.items.ids]
        
    end
end

json.items do 
    @pokemon.items.each do |item|
        json.set! item.id do
        json.extract! item, :id, :name, :pokemon_id, :price, :happiness, :image_url
   
     end
    end
end




    # json.image_url asset_path(poke.image_url)