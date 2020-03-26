class User < ApplicationRecord
    has_many :user_cards 
    has_many :cards, through: :user_cards
    has_secure_password
    validates :name, presence: true
    validates :name, uniqueness: true

end
