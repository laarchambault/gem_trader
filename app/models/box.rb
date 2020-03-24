class Box < ApplicationRecord
    has_many :box_cards
    has_many :cards, through: :box_cards

    def box_for_common
        arr = []
        self.cards.map do |card|
            if card.points_worth.between?(5,25)
                10.times do
                    arr << card
                end
            end
            arr << card
        end
        arr.sample(3)
    end

end
