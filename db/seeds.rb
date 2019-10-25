# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

15.times do
  city = City.create!(
city_name: Faker::Address.city,
zip_code: Faker::Address.zip,
)
end

10.times do
  user = User.create!(
first_name: Faker::Name.first_name,
last_name: Faker::Name.last_name,
description: Faker::ChuckNorris.fact,
email: Faker::Internet.email,
city_id: Faker::Number.between(from: 1, to: 10),
)
end

20.times do
gossip1 = Gossip1.create!(
title: Faker::Superhero.name,
content: Faker::Quotes::Shakespeare.hamlet_quote,
id_user: Faker::Number.between(from: 1, to: 10),
)
end

10.times do
gossiptag = Gossiptag.create!(
id_tag: Faker::Number.between(from: 1, to: 10),
id_gossip1: Faker::Number.between(from: 1, to: 20),
)
end

10.times do
tag = Tag.create!(
title: Faker::JapaneseMedia::DragonBall.character,
)
end
