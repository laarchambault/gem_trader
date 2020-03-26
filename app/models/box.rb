class Box < ApplicationRecord
    has_many :box_cards
    has_many :cards, through: :box_cards

    def cards_at_least_50
        card_arr = []
        until points_total_of_box(card_arr) >= 50
            card_arr = box_populate
        end
        card_arr
    end
    
    def box_populate
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

    def points_total_of_box(array)
        total = 0
        array.each do |card|
            total += card.points_worth
        end
        total
    end

    def enough_points?(user_points)
        if user_points >= self.cost
            return true
        else
            return false
        end
    end


end
