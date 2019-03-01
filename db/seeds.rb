# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
list = JSON.parse(open(url).read)

list['drinks'].each do |ingredient|
Ingredient.create(name: ingredient['strIngredient1'])
end

url2 = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita'
list2 = JSON.parse(open(url2).read)

list2['drinks'].each do |cocktail|
Cocktail.create(name: cocktail['strDrink'])
end
