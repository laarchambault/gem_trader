class BoxCard < ApplicationRecord
    belongs_to :box 
    belongs_to :card
end
