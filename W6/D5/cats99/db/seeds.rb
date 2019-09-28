# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


CatRentalRequest.destroy_all
Cat.destroy_all

Cat.create!(birth_date: '2015/01/20', color: "white", name: "Kitty", sex: "M", description: "I'm Kitty!")
Cat.create!(birth_date: '2011/05/21', color: "black", name: "Fluflu", sex: "F", description: "I'm Fluflu!")
Cat.create!(birth_date: '2000/11/01', color: "gray", name: "Tiger", sex: "M", description: "I'm a Tiger GRWWW!")

CatRentalRequest.create!(cat_id: 1, start_date: '2019/09/12', end_date: '2019/09/14')

