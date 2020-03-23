class Box < ApplicationRecord
    has_many :box_cards
    has_many :cards, through: :box_cards
end
