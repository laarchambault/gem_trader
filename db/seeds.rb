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


#==============================================common
Card.create(name: "Coal", points_worth: 5)
Card.create(name: "Moss Agate", points_worth: 10)
Card.create(name: "Cubic Zirconia", points_worth: 15)
Card.create(name: "Smoky Quartz", points_worth: 16)
Card.create(name: "Lapis Lazuli", points_worth: 18)
Card.create(name: "Ammolite", points_worth: 19)
Card.create(name: "Freshwater Pearl", points_worth: 20)
Card.create(name: "Beryl", points_worth: 20)
Card.create(name: "Garnet", points_worth: 23)
Card.create(name: "Jade", points_worth: 25)
#+=================================================uncommon
Card.create(name: "Moldavite", points_worth: 27)
Card.create(name: "Lemon Quartz", points_worth: 30)
Card.create(name: "Labradorite", points_worth: 34)
Card.create(name: "Amber", points_worth: 40)
Card.create(name: "Opal", points_worth: 61)
Card.create(name: "Khooni Neelam", points_worth: 63)
Card.create(name: "Jasper", points_worth: 75)
Card.create(name: "Apatite Cat's Eye", points_worth: 87)
Card.create(name: "Aventurine", points_worth: 99)
Card.create(name: "Black Onyx", points_worth: 145)
#==================================================rare
Card.create(name: "Sunstone", points_worth: 200)
Card.create(name: "Panjshir Emeralds", points_worth: 276)
Card.create(name: "Favorite Tsavorite", points_worth: 290)
Card.create(name: "Tahitian Pearls", points_worth: 333)
Card.create(name: "Tiger's Eye touched by Ghandi", points_worth: 350)
Card.create(name: "Mind-Controlling Sky Blue Topaz", points_worth: 410)
Card.create(name: "Diamond", points_worth: 500)
Card.create(name: "Cleopatra's Star Sapphire", points_worth: 745)
Card.create(name: "Rainbow Moonstone", points_worth: 800)
Card.create(name: "Key to Heaven", points_worth: 1000)

Box.create(rarity: "Common", cost: 50)
Box.create(rarity: "Uncommon", cost: 150)
Box.create(rarity: "Rare", cost: 1000)

Card.all.each do |c|
    BoxCard.create(card_id: c.id, box_id: Box.first.id)
    BoxCard.create(card_id: c.id, box_id: Box.second.id)
    BoxCard.create(card_id: c.id, box_id: Box.last.id)
end
