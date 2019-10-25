- créé un dos complet ruby on rail RoR
$ rails _5.2.3_ new gossip
CREER UNE CLASSE USER :
rails g model User first_name:string last_name:string description:text email:string age:integer
rails db:migrate
rails db:migrate:status

CREER 10 USER AVEC FAKER : faker: https://github.com/faker-ruby/faker/blob/master/doc/default/address.md/faker)
require 'faker'
10.times do
  user = User.create!(
first_name: Faker::Name.first_name,
last_name: Faker::Name.last_name,
description: Faker::ChuckNorris.fact,
email: Faker::Internet.email,
)
end

APPLIQUER LE CODE :
rails db:seed
VERIFIER LE CODE :
rails console
tp User.all

CREER LES AUTRES TABLES
rails g model City city_name:string zip_code:string
rails g model Gossip1 title:string content:text
rails g model Tag title:string
rails g model PrivateMessage content:text
rails g model Comment content:text
rails g model Like
rails g model Gossiptags


- LIER LES TABLES.
dans /home/cedric/documents/thp/smn4j4/gossip/app/models

user.rb
belongs_to :city
has_many :gossip1s

city.rb
has_many :users

gossip1.rb
belongs_to :user
has_many :tags through gossiptags

tag.rb
has_many :gossip1s through gossiptags

gossiptag.rb
(belongs_to :tag
belongs_to :gossip1) retirer dans la version finale -> à verifier
erreur -> has many tags through gossiptags rIDENTIFIER

CREER LE FICHIER MIGRATION; DOWN POUR MODIFS
dans /home/cedric/documents/thp/smn4j4/gossip/db/migrate
rails db:rollback STEP=8
rails db:migrate:status

MODIFIER LA MIGRATION :
user.rb
t.belongs_to :city

gossip1.rb
t.belongs_to :user

gossiptag.rb
t.belongs_to :tag
t.belongs_to :gossip1



REMIGRER AC LA MODIF
rails db:migrate
rails db:migrate:status



CREER 10 VILLES 20 GOSSIPS AVEC FAKER : faker:https://github.com/faker-ruby/faker/blob/master/doc/default/address.md/faker)

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

Gossiptag.destroy_all
10.times do
gossiptag = Gossiptag.create!(
id_tag: Faker::Number.between(from: 1, to: 10),
id_gossip1: Faker::Number.between(from: 1, to: 20),
)
end

Tag.destroy_all
10.times do
tag = Tag.create!(
title: Faker::JapaneseMedia::DragonBall.character,
)
end



APPLIQUER LE CODE :
rails db:seed
VERIFIER LE CODE :
rails console
tp User.all ok
tp City.all ok
tp Tag.all
tp Gossip1.all
tp Gossiptag.all

tp PrivateMessage.all
tp Comment.all
tp Like.all


ERREUR seed A FIXER :
cedric@cedric-K55A:~/documents/thp/smn4j4/gossip$ rails db:seed
rails aborted!
SyntaxError: /home/cedric/documents/thp/smn4j4/gossip/app/models/gossip1.rb:3: syntax error, unexpected tIDENTIFIER, expecting keyword_end
  has_many :tags through gossiptag

ERREUR TP TAG A FIXER
Traceback (most recent call last):
        1: from (irb):3
SyntaxError (/home/cedric/documents/thp/smn4j4/gossip/app/models/tag.rb:2: syntax error, unexpected tIDENTIFIER, expecting keyword_end)
has_many :gossip1s through gossiptags

ERREUR TP GOSSIP1 A FIXER
2.5.1 :004 > tp Gossip1.all
Traceback (most recent call last):
        1: from (irb):4
SyntaxError (/home/cedric/documents/thp/smn4j4/gossip/app/models/gossip1.rb:3: syntax error, unexpected tIDENTIFIER, expecting keyword_end)
  has_many :tags through gossiptag
                 ^~~~~~~
