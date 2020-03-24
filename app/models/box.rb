class Box < ApplicationRecord
    has_many :box_cards
    has_many :cards, through: :box_cards

    def random_cards
        arr = []
        self.cards.map do |card|
            arr << card
        end
        arr.sample(3)
    end


end
