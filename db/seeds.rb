# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Card.destroy_all
Box.destroy_all
BoxCard.destroy_all
UserCard.destroy_all

User.create(name: "Ariel", points: 50)
User.create(name: "Laura", points: 50)
User.create(name: "Bob", points: 50)
User.create(name: "Tim", points: 50)

Card.create(name: "Rad Ruby", points_worth: 23)
Card.create(name: "Moonstone", points_worth: 803)
Card.create(name: "Coal", points_worth: 5)
Card.create(name: "Diamond", points_worth: 1000)

Box.create(rarity: "Common", cost: 50)
Box.create(rarity: "Uncommon", cost: 150)
Box.create(rarity: "Rare", cost: 1000)

5.times do
    BoxCard.create(card_id: Card.all.sample.id, box_id: Box.all.sample.id)
end

5.times do
    UserCard.create(card_id: Card.all.sample.id, user_id: User.all.sample.id)
end