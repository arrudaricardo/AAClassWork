# json.extract! @guest, :name, :age, :favorite_color 

json.partial! partial: "guest", guest: @guest, action: :show