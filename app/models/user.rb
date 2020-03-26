class User < ApplicationRecord
    has_many :user_cards 
    has_many :cards, through: :user_cards
    has_secure_password
    validates :name, presence: true
    validates :name, uniqueness: true

    def self.top_five_users
        self.order(points: :desc).first(5)
    end

    def num_of_cards
        self.cards.count
    end





    #################     leaderboard methods     #############################
    def self.oldest
        self.first
    end

    def self.newest
        self.last
    end

    def self.richest
        high_score = 0
        high_user = nil
        self.all.each do |user|
            if user.points > high_score
                high_score = user.points
                high_user = user
            end
        end
        high_user
    end

    def self.most_cards
        card_count = 0
        high_user = nil
        self.all.each do |user|
            if user.num_of_cards > card_count
                card_count = user.num_of_cards
                high_user = user
            end
        end
        high_user
    end

    def highest_card #returns highest card in a user's hand
        high_point = 0
        high_card = nil
        self.cards.each do |card|
            if card.points_worth > high_point
                high_point = card.points_worth
                high_card = card
            end
        end
        high_card
    end

    def points_from_highest_card
        self.highest_card.points_worth
    end

    def self.highest_card #returns user with the highest card in hand
        high_card = 0
        high_user = nil
        self.all.each do |user|
            user.cards.each do |card|
                if card.points_worth > high_card
                    high_card = card.points_worth
                    high_user = user
                end
            end
        end
        high_user
    end

    def hand_total
        self.cards.sum do |card|
            card.points_worth
        end
    end

    def self.highest_hand
        hand_count = 0
        high_user = nil
        self.all.each do |user|
            if user.hand_total > hand_count
                hand_count = user.hand_total
                high_user = user
            end
        end
        high_user
    end


end
