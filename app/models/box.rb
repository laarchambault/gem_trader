class Box < ApplicationRecord
    has_many :box_cards
    has_many :cards, through: :box_cards

    def box_for_common
        arr = []
        self.cards.map do |card|
            if card.points_worth.between?(5,25) && self.rarity == "Common"
                10.times do
                    arr << card
                end
            elsif card.points_worth.between?(5,150) && self.rarity == "Uncommon"
                10.times do
                    arr << card
                end
            elsif card.points_worth.between?(151,1000) && self.rarity == "Rare"
                4.times do
                    arr << card
                end
            end
            arr << card
        end
        arr.sample(3)
    end

    def enough_points?(user_points)
        if user_points >= self.cost
            return true
        else
            return false
        end
    end


end
