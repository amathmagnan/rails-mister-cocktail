# frozen_string_literal: true

# :nodoc:
require 'json'
require 'rest-client'

# -------------INGREDIENTS-----------------
puts 'parsing ingredients'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
response = RestClient.get url
repos = JSON.parse(response)
ingredients = repos.values.flatten
p ingredients
p ingredients.length
p ingredients.class
ingredients.each do |i|
  ingred = i.values.join('')
  p ingred
  ingre = Ingredient.new(name: ingred.to_s)
  ingre.save
  # end
end
puts 'Ingredients all Saved '

# ---------------COCKTAILS----------------
puts 'Wait..........................'
puts 'cocktails now.........'
15.times do
  id = [11634, 15951, 12418, 17208, 11046, 12370, 15224, 17192, 12688, 13775, 12672, 11006, 11542, 11028, 12656, 13395, 12862, 17250, 17233, 14598,].sample
  url = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{id}"
  response = RestClient.get url
  repos = JSON.parse(response)
  cocktails = repos.values
  cocktails.each_with_index do |c, i|
    cock = Cocktail.new(name: c[i].values[1])
    p cock
    cock.save
  end
end
puts 'cocktails saved !!!'
















