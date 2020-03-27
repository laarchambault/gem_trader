class Card < ApplicationRecord
    has_many :user_cards
    has_many :users, through: :user_cards
    has_many :box_cards
    has_many :boxes, through: :box_cards

    def display_card
        "   #{self.name}: #{self.points_worth} points."
    end
end
